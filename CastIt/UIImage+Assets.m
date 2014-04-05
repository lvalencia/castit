//
//  UIImage+Assets.m
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "UIImage+Assets.h"

@implementation UIImage (Assets)

+ (UIImage *) refresh   { return [[UIImage imageNamed:@"refresh"]   imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; }
+ (UIImage *) add       { return [[UIImage imageNamed:@"add"]       imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; }
+ (UIImage *) checkmark { return [[UIImage imageNamed:@"checkmark_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; }
+ (UIImage *) chromecastIconSelected    { return [[UIImage imageNamed:@"chromecast_icon_red"]   imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; }
+ (UIImage *) chromecastIconUnselected  { return [[UIImage imageNamed:@"chromecast_icon_olive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; }

+ (NSArray *) connectingAnimationArray {
    return [NSArray arrayWithObjects:
              [UIImage imageNamed:@"connecting_indicator_1"],
              [UIImage imageNamed:@"connecting_indicator_2"],
              [UIImage imageNamed:@"connecting_indicator_3"],
              [UIImage imageNamed:@"connecting_indicator_4"],
              [UIImage imageNamed:@"connecting_indicator_5"],
              [UIImage imageNamed:@"connecting_indicator_6"],
            nil];
}

@end
