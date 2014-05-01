//
//  CIMediaDeviceFinder.m
//  CastIt
//
//  Created by Luis Valencia on 4/8/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIMediaDeviceFinder.h"

@implementation CIMediaDeviceFinder

@synthesize scanner;

- (void) startScan{
    if (scanner == nil){
        scanner = [[NSNetServiceBrowser alloc] init];
        [scanner setDelegate:self];
        [scanner searchForBrowsableDomains];
        //[scanner searchForRegistrationDomains];
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
    [scanner searchForServicesOfType:@"_services._dns-sd._udp." inDomain:_domain];
}

- (void) netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didRemoveDomain:(NSString *)domainString moreComing:(BOOL)moreComing{
    NSLog(@"REMOVED DOMAIN");
}

- (void) netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing{
    NSLog(@"FOUND SERVICE OF TYPE %@ WITH NAME %@", [netService type], [netService name]);
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
}

- (void) netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didRemoveService:(NSNetService *)aNetService moreComing:(BOOL)moreComing{
    NSLog(@"REMOVED SERVICE");
}

- (void) netServiceBrowser:(NSNetServiceBrowser *)aNetServiceBrowser didNotSearch:(NSDictionary *)errorDict{
    NSLog(@"I DIDNT SEARCH SHIT");
}

- (void) netServiceBrowserDidStopSearch:(NSNetServiceBrowser *)aNetServiceBrowser{
    NSLog(@"STOPPED SEARCHING");
}

@end
