//
//  CIContentView.m
//  CastIt
//
//  Created by Luis Valencia on 3/26/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIContentView.h"
#import "Reachability.h"

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

- (IBAction) searchForChromeCasts:(CIButton *)sender{
    NSLog(@"I'm Searching for Chrome Casts");
    //Set up the Table View
    //Set up the Spinning Icon
    //Fade out the Placeholder and Fade in the table View
    [UIView animateWithDuration:1.0 animations:^(void) {
        sender.alpha = 0;
    }];
}

- (IBAction) searchForMediaLocations:(CIButton*) sender{
    NSLog(@"I'm Searching for Media Locations");
    
    if ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != ReachableViaWiFi) {
        //Code to execute if WiFi is not enabled
        NSLog(@"NOT CONNECTED TO WIFI");
    }
     
    if ([sender buttonStyle] == ciMediaListButton){
        [UIView animateWithDuration:1.0 animations:^(void) {
            sender.alpha = 0;
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
