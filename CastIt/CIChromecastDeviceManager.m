//
//  CIChromecastDeviceManager.m
//  CastIt
//
//  Created by Luis Valencia on 4/7/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIChromecastDeviceManager.h"

@implementation CIChromecastDeviceManager

- (id) initWithDevice:(GCKDevice *)device clientPackageName:(NSString *)clientPackageName connectionIndicator:(id<CIIndicator>) indicator{
    self = [super initWithDevice:device clientPackageName:clientPackageName];
    if (self){
        [self setDelegate:self];
        _indicator = indicator;
    }
    return self;
}

#pragma mark - GCKDeviceManagerDelegate
- (void) deviceManagerDidConnect:(GCKDeviceManager *)deviceManager{
    NSLog(@"Connected");
    [_indicator indicateStatusConnected];
   // [self launchApplication:@"APP_ID"];
}

@end
