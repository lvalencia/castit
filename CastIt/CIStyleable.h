//
//  CIStyleable.h
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+Palette.h"
#import "NSString+Copy.h"
#import "UIFont+Typeface.h"

@protocol CIStyleable <NSObject>

- (void) applyStyle;

@end
