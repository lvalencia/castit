//
//  CIChromecastDeviceManager.h
//  CastIt
//
//  Created by Luis Valencia on 4/7/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <GoogleCast/GoogleCast.h>
#import "CIIndicator.h"

@interface CIChromecastDeviceManager : GCKDeviceManager<GCKDeviceManagerDelegate>{
    id _indicator;
}

- (id) initWithDevice:(GCKDevice *)device clientPackageName:(NSString *)clientPackageName connectionIndicator:(id<CIIndicator>) indicator;

@end
