//
//  CIMediaDeviceFinder.m
//  CastIt
//
//  Created by Luis Valencia on 4/8/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIMediaDeviceFinder.h"
#import "CINetService.h"

@interface CIMediaDeviceFinder ()

- (CINetService *) firstServiceToNotBeResolved;

@end

@implementation CIMediaDeviceFinder

@synthesize scanner;
@synthesize servicesFound;

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
        //[scanner searchForRegistrationDomains];
    }
}

- (CINetService *) firstServiceToNotBeResolved{
    for(CINetService* service in servicesFound){
        if (![service ranResolve]){ return service; }
    }
    return nil;
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
    if (moreServicesComing == NO){
        [scanner stop];
        _firstRoundDiscovery = NO;
         //Trigger Update UI
    }

   // CINetService* temp = [[CINetService alloc] initWithService:netService];
    //[netService setDelegate:self];
    //[netService resolveWithTimeout:5.0];
   // [servicesFound addObject:temp];
    //Extend NSNetService
    //Init from the Returned Service
    //Create BackLink it to This for When it Resolves 
    //Need to Set up a Delete, Resolve IP, Connect with it, then Open Stream (input/output) to send command and start poking around

    /*
    NSInputStream *istream = nil;
    
    NSOutputStream *ostream = nil;
    [netService getInputStream:&istream outputStream:&ostream];
    
    if (istream && ostream)
    {
        // Use the streams as you like for reading and writing.
    }
    else
    {
        NSLog(@"Failed to acquire valid streams");
    }
     */
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
        else {
            while(service){
                [service setRanResolve:YES];
                [service setDelegate:self];
                [service resolveWithTimeout:5.0];
                service = [self firstServiceToNotBeResolved];
            }
        }
    }
}

#pragma mark - NSNetServiceDelegate Methods
- (void)netServiceWillPublish:(NSNetService *)sender{
    NSLog(@"WILL PUBLISH");
}
- (void)netService:(NSNetService *)sender didNotPublish:(NSDictionary *)errorDict{
    NSLog(@"DID NOT PUBLISH");
}
- (void)netServiceDidPublish:(NSNetService *)sender{
    NSLog(@"DID PUBLISH");
}
- (void)netServiceWillResolve:(NSNetService *)sender{
    NSLog(@"RESOLVING SERVICE OF TYPE %@ WITH NAME %@ AND DOMAIN %@", [sender type], [sender name], [sender domain]);
}
- (void)netService:(NSNetService *)sender didNotResolve:(NSDictionary *)errorDict{
    NSLog(@"DID NOT RESOLVE");
    NSLog(@"Dictionary: %@", [errorDict description]);
}
- (void)netService:(NSNetService *)sender didUpdateTXTRecordData:(NSData *)data{
    NSLog(@"UPDATED TXT RECORD DATA");
}
- (void)netServiceDidStop:(NSNetService *)sender{
    NSLog(@"SERVICE THAT STOPPED IS OF TYPE %@ WITH NAME %@ AND DOMAIN %@", [sender type], [sender name], [sender domain]);

}
- (void)netServiceDidResolveAddress:(NSNetService *)sender{
    NSLog(@"SERVICE THAT RESOLVED IS OF TYPE %@ WITH NAME %@ AND DOMAIN %@", [sender type], [sender name], [sender domain]);
}

@end
