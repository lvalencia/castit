//
//  CINetService.h
//  CastIt
//
//  Created by Luis Valencia on 8/6/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CINetService : NSNetService

@property (atomic) BOOL wasDiscoveredByDomainBrowse;
@property (atomic) BOOL ranResolve;
@property (atomic) BOOL successfullyResolved;

- (id) initWithService:(NSNetService *)service;
- (BOOL) readyForCommunication;
- (BOOL) openForCommunication;

@end
