//
//  CIChromecastFinder.h
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleCast/GoogleCast.h>

@interface CIChromecastFinder : NSObject<GCKDeviceScannerListener>{
    BOOL didBeginScan;
}
@property (nonatomic, strong) GCKDeviceScanner *scanner;

- (void) scanForDevices;
- (NSInteger) deviceCount;

@end
