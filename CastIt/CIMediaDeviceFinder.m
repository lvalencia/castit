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
#import "CIApplicationConstants.h"
#include "arpa/inet.h"

@interface CIMediaDeviceFinder ()

- (NSString *) nextServiceType;
- (CINetService *) firstServiceToNotBeResolved;
- (NSArray *) devicesReadyForConnection;
- (void) startCountDown;
- (void) stopCountDown;

@end

@implementation CIMediaDeviceFinder

@synthesize scanner;
@synthesize servicesFound;
@synthesize servicesReady;

- (id) initWithTableView: (CITableView *) tableView{
    self = [super init];
    if (self) {
        _tableView = tableView;
        _currentServiceIndex = 0;
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
- (void) stopScan {
    [scanner stop];
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
- (NSString *) nextServiceType {
    NSArray* protocols = [NSArray allProtocols];
    if (_currentServiceIndex < [protocols count]){
        return [[NSArray allProtocols] objectAtIndex:_currentServiceIndex++];
    }
    return  nil;
}
- (void) startCountDown{
    _searchTimer = [NSTimer scheduledTimerWithTimeInterval:MAX_SERVICE_SEARCH_TIME
                                                    target:self
                                                  selector:@selector(stopScan)
                                                  userInfo:nil
                                                   repeats:NO];
}
- (void) stopCountDown{
    if ([_searchTimer isValid]){
        [_searchTimer invalidate];
    }
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
    NSString *nextServiceTypeToSearch = [self nextServiceType];
    NSLog(@"SEARCHING FOR SERVICES OF TYPE %@",  nextServiceTypeToSearch);
    [scanner searchForServicesOfType:nextServiceTypeToSearch inDomain:_domain];
    [self startCountDown];
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
        [self stopCountDown];
        CINetService* service = [[CINetService alloc] initWithService:netService];
        [service setRanResolve:YES];
        [service setDelegate:self];
        [service resolveWithTimeout:15.0];
        [servicesFound addObject:service];
        [self startCountDown];
    }
    if (moreServicesComing == NO){
        [self stopCountDown];
        [scanner stop];
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

    NSString *nextServiceTypeToSearch = [self nextServiceType];
    if (nextServiceTypeToSearch){
        NSLog(@"SEARCHING FOR SERVICES OF TYPE %@",  nextServiceTypeToSearch);
        [scanner searchForServicesOfType:nextServiceTypeToSearch inDomain:_domain];
        [self startCountDown];
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
