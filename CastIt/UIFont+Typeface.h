//
//  UIFont+Typeface.h
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Typeface)

+ (UIFont *) headerSectionTypeface;
+ (UIFont *) headerButtonTypeface;
+ (UIFont *) contentSectionTypeface;
+ (UIFont *) contentSectionHighlightedTypeface;
+ (UIFont *) footerTypeface;
+ (UIFont *) tableViewCellTypeface;

+ (void) listSupportedFonts;

@end
