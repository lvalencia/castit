//
//  CIContentView+Adjusted.m
//  CastIt
//
//  Created by Luis Valencia on 3/29/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIContentView+Adjusted.h"
#import "CIApplicationConstants.h"

@implementation CIContentView (Adjusted)

- (void) layoutSubviews{
    [super layoutSubviews];

    if (isiPhone5) {
        //Adjust Content
        CGRect desiredFrame = self.frame;
        desiredFrame.size.height += contentViewiPhone5Offset;
        self.frame = desiredFrame;
        
        //Adjust Placeholder
        [self.placeholderContent setCenter:CGPointMake(desiredFrame.size.width/2,
                                                       desiredFrame.size.height/2 + contentViewiPhone5Offset)];
    }
}

@end
