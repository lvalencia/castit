//
//  CIHomeView+Adjusted.m
//  CastIt
//
//  Created by Luis Valencia on 3/29/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIHomeView+Adjusted.h"
#import "CIApplicationConstants.h"

@implementation CIHomeView (Adjusted)

- (void) layoutSubviews{
    [super layoutSubviews];
    
    if (isiPhone5) {
        CGRect desiredFrame = self.mediaLocationsView.frame;
        desiredFrame.origin.y += contentViewiPhone5Offset;
        self.mediaLocationsView.frame = desiredFrame;
    }
}

@end
