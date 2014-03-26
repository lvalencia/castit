//
//  UIColor+Palette.h
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Palette)

+ (UIColor *) mainBackgroundColor;
+ (UIColor *) headerSectionBackgroundColor;
+ (UIColor *) contentSectionBackgroundColor;

+ (UIColor *) headerSectionTextColor;
+ (UIColor *) contentSectionTextColor;
+ (UIColor *) contentSectionHighlightedTextColor;

@end
