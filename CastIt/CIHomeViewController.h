//
//  CIHomeViewController.h
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIViewController.h"
#import "CIChromecastFinder.h"

@class CIButton;

@interface CIHomeViewController : CIViewController

@property (nonatomic, strong) CIChromecastFinder *chromecastFinder;

- (IBAction) searchForChromeCasts:(CIButton *)sender;
- (IBAction) searchForMediaLocations:(CIButton*) sender;

@end
