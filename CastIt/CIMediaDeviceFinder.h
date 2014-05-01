//
//  CIMediaDeviceFinder.h
//  CastIt
//
//  Created by Luis Valencia on 4/8/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CIMediaDeviceFinder : NSObject<NSNetServiceBrowserDelegate>{
    NSString *_domain;
}

@property (nonatomic, strong) NSNetServiceBrowser* scanner;

- (void) startScan;

@end
