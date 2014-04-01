//
//  UIColor+Palette.m
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "UIColor+Palette.h"

@implementation UIColor (Palette)

+ (UIColor *) mainBackgroundColor           { return [UIColor colorFromHexValue:0xc43751]; }
+ (UIColor *) headerSectionBackgroundColor  { return [UIColor colorFromHexValue:0xf1dfa9]; }
+ (UIColor *) contentSectionBackgroundColor { return [UIColor colorFromHexValue:0xfff0c1]; }

+ (UIColor *) headerSectionTextColor                { return [UIColor colorFromHexValue:0x6e674f]; }
+ (UIColor *) contentSectionTextColor               { return [UIColor colorFromHexValue:0x6e674f]; }
+ (UIColor *) contentSectionHighlightedTextColor    { return [UIColor colorFromHexValue:0xc43751]; }

+ (UIColor *) buttonTextColor   { return [UIColor colorFromHexValue:0xffffff]; }
+ (UIColor *) standardLabelColor{ return [UIColor colorFromHexValue:0xffffff]; }

@end
