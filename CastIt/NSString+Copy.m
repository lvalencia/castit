//
//  NSString+Copy.m
//  CastIt
//
//  Created by Luis Valencia on 3/26/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "NSString+Copy.h"
#import "CIContentView.h"

@implementation NSString (Copy)

+ (NSString *) webURL                       { return @"www.cast.it"; }
+ (NSString *) chromecastHeaderTitle        { return @"Select Available Chromecasts"; }
+ (NSString *) mediaListHeaderTitle         { return @"Media Location"; }
+ (NSString *) chromecastContentInstructions{ return @"No Chromecasts"; }
+ (NSString *) mediaListContentInstructions { return @"Please add a media location above."; }
+ (NSString *) refreshChromecastInstructions{ return @"Scan Network"; }
+ (NSString *) headerButtonText             { return @"Add Location"; }

+ (NSString *) wifiAlertTitle               { return @"Not Connected To Local Wifi"; }
+ (NSString *) wifiChromecastAlertMessage   { return @"In order to connect to Chromecast on the network, this phone must also be connected to the network."; }
+ (NSString *) wifiMediaAlertMessage        { return @"In order to connect to your Media on the network, this phone must also be connected to the network."; }
+ (NSString *) wifiAlertCancelButtonTitle   { return @"Cancel"; }
+ (NSString *) wifiAlertOkayTitle           { return @"OK"; }

+ (NSString *) stringForHeader: (CIContentHeader *) header{
    switch ([header headerType]) {
        case ciChromeCastView:
            return [NSString chromecastHeaderTitle];
            break;
        case ciMediaListView:
            return [NSString mediaListHeaderTitle];
        default:
            return @"Header Copy";
            break;
    }
}

@end
