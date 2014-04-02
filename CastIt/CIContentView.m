//
//  CIContentView.m
//  CastIt
//
//  Created by Luis Valencia on 3/26/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIContentView.h"

@implementation CIContentHeader

@synthesize headerType, headerTitle, headerButton;

- (void) applyStyle{
    [self setBackgroundColor:[UIColor headerSectionBackgroundColor]];
    [headerTitle setLabelStyle:[self class]];
    [headerTitle applyStyle];
    [headerButton setButtonStyle:ciAddLocation];
    [headerButton applyStyle];
}

@end

@implementation CIContentView

@synthesize contentHeader, contentType, placeholderContent, tableView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) applyStyle{
    [self setBackgroundColor:[UIColor contentSectionBackgroundColor]];
    [contentHeader setHeaderType:[self contentType]];
    [contentHeader applyStyle];
    
    switch ([self contentType]) {
        case ciChromeCastView:
            [placeholderContent setButtonStyle:ciChromeCastRefreshButton];
            break;
        case ciMediaListView:
            [placeholderContent setButtonStyle:ciMediaListButton];
            break;
        default:
            break;
    }
    
    [placeholderContent applyStyle];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
