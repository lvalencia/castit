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
