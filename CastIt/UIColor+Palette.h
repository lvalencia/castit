//
//  UIColor+Palette.h
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Conversion.h"

@interface UIColor (Palette)

+ (UIColor *) mainBackgroundColor;
+ (UIColor *) headerSectionBackgroundColor;
+ (UIColor *) contentSectionBackgroundColor;

+ (UIColor *) headerSectionTextColor;
+ (UIColor *) contentSectionTextColor;
+ (UIColor *) contentSectionHighlightedTextColor;

+ (UIColor *) tableSeperatorInsetColor;
+ (UIColor *) tableViewBackgroundColor;
+ (UIColor *) highlightedTableCellColor;

+ (UIColor *) buttonTextColor;
+ (UIColor *) standardLabelColor;

@end
