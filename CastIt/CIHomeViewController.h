//
//  CIHomeViewController.h
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIViewController.h"

@class CIButton;
@class CIChromecastFinder;
@class CIMediaDeviceFinder;
@class CIChromecastDeviceManager;

@interface CIHomeViewController : CIViewController

@property (nonatomic, strong) CIChromecastFinder *chromecastFinder;
@property (nonatomic, strong) CIChromecastDeviceManager *chromecastManager;
@property (nonatomic, strong) CIMediaDeviceFinder *mediaListFinder;

+ (CIHomeViewController *) instance;

- (IBAction) searchForChromeCasts:(CIButton *)sender;
- (IBAction) searchForMediaLocations:(CIButton*) sender;

@end
