//
//  CIChromecastFinder.h
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleCast/GoogleCast.h>

@class CITableView;
@class CITableViewCell;

@interface CIChromecastFinder : NSObject<GCKDeviceScannerListener>{
    BOOL didBeginScan;
    CITableView *_tableView;
}

@property (nonatomic, strong) GCKDeviceScanner *scanner;

- (void) scanForDevices;
- (NSInteger) deviceCount;
- (GCKDevice *) deviceAtIndex: (NSInteger) index;
- (id) initWithTableView: (CITableView *) tableView;
- (void) connectToDeviceWithName:(NSString *) deviceName fromSender:(CITableViewCell *) sender;

@end
