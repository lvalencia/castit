//
//  CIMediaDeviceFinder.m
//  CastIt
//
//  Created by Luis Valencia on 4/8/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIMediaDeviceFinder.h"
#import "CINetService.h"
#import "CITableView.h"
#import "NSArray+FileSharingProtocols.h"
#include "arpa/inet.h"

@interface CIMediaDeviceFinder ()

- (CINetService *) firstServiceToNotBeResolved;
- (NSArray *) devicesReadyForConnection;

@end

@implementation CIMediaDeviceFinder

@synthesize scanner;
@synthesize servicesFound;
@synthesize servicesReady;

- (id) initWithTableView: (CITableView *) tableView{
    self = [super init];
    if (self) {
        _tableView = tableView;
        _firstRoundDiscovery = YES;
    }
    return self;
}

- (void) startScan{
    if (scanner == nil){
        scanner = [[NSNetServiceBrowser alloc] init];
        [scanner setDelegate:self];
        [scanner searchForBrowsableDomains];
    }
    else {
        [scanner stop];
        [scanner searchForBrowsableDomains];
    }
}

- (NSInteger) deviceCount{
    //return [[self devicesReadyForConnection] count];
    return [servicesReady count];
}

- (NSNetService *) deviceAtIndex: (NSInteger) index{
    //return [[self devicesReadyForConnection] objectAtIndex:index];
    return [servicesReady objectAtIndex:index];
}

#pragma mark - Private Methods

- (CINetService *) firstServiceToNotBeResolved{
    for(CINetService* service in servicesFound){
        if (![service ranResolve]){ return service; }
    }
    return nil;
}
- (NSArray *) devicesReadyForConnection{
    NSPredicate* p = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary* bindings){
        return [(CINetService *)evaluatedObject readyForCommunication];
    }];
    NSArray* hold= [servicesFound filteredArrayUsingPredicate:p];
    return hold;
}

#pragma mark - NSNetServiceBrowserDelegate Methods

- (void) netServiceBrowserWillSearch:(NSNetServiceBrowser *)aNetServiceBrowser{
    NSLog(@"STARTING SEARCH");
}

- (void) netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didFindDomain:(NSString *)domainString moreComing:(BOOL)moreComing{
    NSLog(@"FOUND DOMAIN %@", domainString);
    _domain = domainString;
    
    [scanner stop];
    //discover all service types in all domains use
    for (NSString*  string in [NSArray allProtocols]){
        NSLog(@"%@", string);
    }
    [scanner searchForServicesOfType:@"_services._dns-sd._udp." inDomain:_domain];
}

- (void) netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didRemoveDomain:(NSString *)domainString moreComing:(BOOL)moreComing{
    NSLog(@"REMOVED DOMAIN");
}

- (void) netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing{
    NSLog(@"FOUND SERVICE OF TYPE %@ WITH NAME %@ AND DOMAIN %@", [netService type], [netService name], [netService domain]);
    if (servicesFound == nil){
        servicesFound = [[NSMutableArray alloc] init];
    }
    if (![servicesFound containsObject:netService]){
        [servicesFound addObject:[[CINetService alloc] initWithService:netService didDiscoverByDomainBrowse:_firstRoundDiscovery]];
    }
    if (moreServicesComing == NO && _firstRoundDiscovery){
        [scanner stop];
        _firstRoundDiscovery = NO;
    }
}

- (void) netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didRemoveService:(NSNetService *)aNetService moreComing:(BOOL)moreComing{
    NSLog(@"REMOVED SERVICE");
    [servicesFound removeObject:aNetService];
}

- (void) netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didNotSearch:(NSDictionary *)errorDict{
    NSLog(@"I DIDNT SEARCH SHIT");
}

- (void) netServiceBrowserDidStopSearch:(NSNetServiceBrowser *)aNetServiceBrowser{
    NSLog(@"STOPPED SEARCHING");
    
    CINetService *service = [self firstServiceToNotBeResolved];
    if (service){
        if ([service wasDiscoveredByDomainBrowse]){
            [servicesFound removeObject:service];
            NSString* actualServiceType = [NSString stringWithFormat:@"%@.%@", [service name], [[service type] stringByReplacingOccurrencesOfString:@"local." withString:@""]];
            [scanner searchForServicesOfType:actualServiceType inDomain:_domain];
        }
        else if (![service ranResolve]) {
            while(service){
                [service setRanResolve:YES];
                [service setDelegate:self];
                [service resolveWithTimeout:15.0];
                service = [self firstServiceToNotBeResolved];
            }
        }
    }
}

#pragma mark - NSNetServiceDelegate Methods
- (void)netServiceWillResolve:(CINetService *)sender{
    NSLog(@"RESOLVING SERVICE OF TYPE %@ WITH NAME %@ AND DOMAIN %@", [sender type], [sender name], [sender domain]);
}
- (void)netServiceDidResolveAddress:(CINetService *)sender{
    [sender setSuccessfullyResolved:YES];
    NSLog(@"SERVICE THAT RESOLVED IS OF TYPE %@ WITH NAME %@ AND DOMAIN %@", [sender type], [sender name], [sender domain]);
    NSData* address = [[sender addresses] objectAtIndex:0];
    struct sockaddr_in* socketAddress = (struct sockaddr_in *) [address bytes];
    NSString* ipString = [NSString stringWithFormat: @"%s", inet_ntoa (socketAddress->sin_addr)];
    int port = socketAddress->sin_port;
    NSLog(@"SERVICE IS FOUND ON IP %@ PORT %d",ipString,port);
    
    if (servicesReady == nil){
        servicesReady = [[NSMutableArray alloc] init];
    }
    if (![servicesReady containsObject:sender]){
        [servicesReady addObject:sender];
    }

    //Update UI
    [_tableView reloadData];
}
- (void)netService:(CINetService *)sender didNotResolve:(NSDictionary *)errorDict{
    NSLog(@"DID NOT RESOLVE");
    NSLog(@"Dictionary: %@", [errorDict description]);
}
- (void)netServiceDidStop:(CINetService *)sender{
    NSLog(@"SERVICE THAT STOPPED IS OF TYPE %@ WITH NAME %@ AND DOMAIN %@", [sender type], [sender name], [sender domain]);
    
}

@end
