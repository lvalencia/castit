//
//  CINetService.m
//  CastIt
//
//  Created by Luis Valencia on 8/6/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CINetService.h"

@implementation CINetService
@synthesize wasDiscoveredByDomainBrowse;
@synthesize ranResolve;
@synthesize successfullyResolved;

- (id) initWithService:(NSNetService *)service didDiscoverByDomainBrowse:(BOOL) discoveryMethodWasDomainBrowsing {
    self = [super initWithDomain:[service domain] type:[service type] name:[service name]];
    if (self) {
        wasDiscoveredByDomainBrowse = discoveryMethodWasDomainBrowsing;
    }
    return self;
}
- (BOOL) readyForCommunication{
    return ranResolve && successfullyResolved;
}

- (BOOL) openForCommunication{
    NSInputStream *istream = nil;
    
    NSOutputStream *ostream = nil;
    [self getInputStream:&istream outputStream:&ostream];
    
    if (istream && ostream)
    {
        // Use the streams as you like for reading and writing.
        return YES;
    }
    else
    {
        NSLog(@"Failed to acquire valid streams");
        return NO;
    }
}

@end
