//
//  CIHomeView.h
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIView.h"
#import "CIContentView.h"

@interface CIHomeView : CIView<CIStyleable>

@property (nonatomic, strong) IBOutlet UIImageView *castItHeader;
@property (nonatomic, strong) IBOutlet CIContentView *chromecastsView;
@property (nonatomic, strong) IBOutlet CIContentView *mediaLocationsView;
@property (nonatomic, strong) IBOutlet CIButton *website;
@property (nonatomic, strong) IBOutlet CIButton *FAQ;

- (IBAction) openSite:(CIButton *) websiteButton;
- (IBAction) openFAQSectionOfSite:(CIButton *) FAQButton;

- (void) prepareViewForChromecastDeviceListing;
- (void) displayChromecastTable;

- (void) prepareViewForMediaListing;
- (void) displayMediaListTable;

@end
