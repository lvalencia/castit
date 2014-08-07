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

- (id) initWithService:(NSNetService *)service didDiscoverByDomainBrowse:(BOOL) discoveryMethodWasDomainBrowsing {
    self = [super initWithDomain:[service domain] type:[service type] name:[service name]];
    if (self) {
        wasDiscoveredByDomainBrowse = discoveryMethodWasDomainBrowsing;
    }
    return self;
}

@end
