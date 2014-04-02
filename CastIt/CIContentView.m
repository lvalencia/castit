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

- (void) prepareTableForViewing{
    if (tableView == nil){
        CGFloat heightDisplacement = contentHeader.frame.size.height;
        CGFloat desiredHeight = self.frame.size.height - heightDisplacement;
        tableView = [[CITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, heightDisplacement, self.frame.size.width, desiredHeight)];
    }
    [tableView applyStyle];
}
- (void) showTable {
    if (tableView.superview == nil){
        [tableView setAlpha:0.0];
        [self addSubview:tableView];
        [tableView reloadData];
        
        [UIView animateWithDuration:0.5 animations:^(void) {
            tableView.alpha = 1;
        }];
    }
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
