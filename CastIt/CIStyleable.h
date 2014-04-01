//
//  CIStyleable.h
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "UIColor+Palette.h"
#import "NSString+Copy.h"
#import "UIFont+Typeface.h"
#import "UIImage+Assets.h"
#import "UIImage+Conversion.h"

#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE

@protocol CIStyleable <NSObject>

- (void) applyStyle;

@end
