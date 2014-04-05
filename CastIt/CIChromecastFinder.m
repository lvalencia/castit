//
//  CIChromecastFinder.m
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIChromecastFinder.h"
#import "CITableViewCell.h"

@implementation CIChromecastFinder

@synthesize scanner;

- (id)init
{
    self = [super init];
    if (self) {
        didBeginScan = NO;
    }
    return self;
}

- (void) scanForDevices{
    if (!didBeginScan) {
        if (scanner == nil){
            scanner = [[GCKDeviceScanner alloc] init];
        }
        [scanner addListener:self];
        [scanner startScan];
        didBeginScan = YES;
    }
}
- (NSInteger) deviceCount {
    return [[scanner devices] count];
}

- (GCKDevice *) deviceAtIndex: (NSInteger) index{
    return [[scanner devices] objectAtIndex:index];
}

- (void) connectToDeviceWithName:(NSString *) deviceName fromSender:(CITableViewCell *) sender{
    NSInteger index = [[scanner devices] indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        GCKDevice* device = (GCKDevice*) obj;
        return ([[device friendlyName] isEqualToString:[obj friendlyName]]);
    }];
    if (index >= 0 && index < [[scanner devices] count]){
        [sender indicateStatusConnected];
    }
}

#pragma mark - GCKDeviceScannerListener
- (void)deviceDidComeOnline:(GCKDevice *)device {
    NSLog(@"device found!!!");
    //Refresh Table View
}

- (void)deviceDidGoOffline:(GCKDevice *)device {
    NSLog(@"device disappeared!!!");
    //Refresh Table View
}

@end
