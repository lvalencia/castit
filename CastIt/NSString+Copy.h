//
//  NSString+Copy.h
//  CastIt
//
//  Created by Luis Valencia on 3/26/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CIContentHeader;

@interface NSString (Copy)

+ (NSString *) webURL;
+ (NSString *) chromecastHeaderTitle;
+ (NSString *) mediaListHeaderTitle;
+ (NSString *) chromecastContentInstructions;
+ (NSString *) mediaListContentInstructions;
+ (NSString *) refreshChromecastInstructions;
+ (NSString *) headerButtonText;

+ (NSString *) stringForHeader: (CIContentHeader *) header;

@end
