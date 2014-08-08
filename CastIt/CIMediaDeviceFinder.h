//
//  CIMediaDeviceFinder.h
//  CastIt
//
//  Created by Luis Valencia on 4/8/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CITableView;
@class CITableViewCell;
@class CINetService;

@interface CIMediaDeviceFinder : NSObject<NSNetServiceBrowserDelegate, NSNetServiceDelegate>{
    NSString *_domain;
    CITableView *_tableView;
    NSTimer *_searchTimer;
    NSUInteger _currentServiceIndex;
}

@property (nonatomic, strong) NSNetServiceBrowser* scanner;
@property (nonatomic, retain) NSMutableArray *servicesFound;
@property (nonatomic, strong) NSMutableArray *servicesReady;

- (id) initWithTableView: (CITableView *) tableView;
- (void) startScan;
- (void) stopScan;
- (NSInteger) deviceCount;
- (NSNetService *) deviceAtIndex: (NSInteger) index;

@end
