//
//  CIHomeView.m
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIHomeView.h"
#import "NSURL+Links.h"

@implementation CIHomeView

@synthesize castItHeader;
@synthesize chromecastsView, mediaLocationsView;
@synthesize website, FAQ;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) applyStyle{
    [self setBackgroundColor:[UIColor mainBackgroundColor]];
    [castItHeader setBackgroundColor:[UIColor clearColor]];
    
    [chromecastsView setContentType:ciChromeCastView];
    [chromecastsView applyStyle];
    
    [mediaLocationsView setContentType:ciMediaListView];
    [mediaLocationsView applyStyle];
    
    [website setButtonStyle:ciWebsiteButton];
    [website applyStyle];
    
    [FAQ setButtonStyle:ciFAQbutton];
    [FAQ applyStyle];
}

- (IBAction) openSite:(CIButton *) websiteButton{
    [[UIApplication sharedApplication] openURL:[NSURL webURL]];
}
- (IBAction) openFAQSectionOfSite:(CIButton *) FAQButton{
    [[UIApplication sharedApplication] openURL:[NSURL FAQURL]];
}

- (void) prepareViewForChromecastDeviceListing {
    [chromecastsView prepareTableForViewing];
}
- (void) displayChromecastTable{
    [chromecastsView showTable];
}

- (void) prepareViewForMediaListing{
    [mediaLocationsView prepareTableForViewing];
}
- (void) displayMediaListTable{
    [mediaLocationsView showTable];
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
