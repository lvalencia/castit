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
+ (UIImage *) chromecastIconSelected    { return [[UIImage imageNamed:@"chromecast_icon_red"]   imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; }
+ (UIImage *) chromecastIconUnselected  { return [[UIImage imageNamed:@"chromecast_icon_olive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; }

@end
