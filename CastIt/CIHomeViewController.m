//
//  CIHomeViewController.m
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIHomeViewController.h"
#import "CIChromecastFinder.h"
#import "CIMediaDeviceFinder.h"
#import "CIChromecastDeviceManager.h"
#import "CIHomeView.h"
#import "CIButton.h"
#import "CIAlertView.h"
#import "Reachability.h"

@interface CIHomeViewController ()

@end

@implementation CIHomeViewController

static CIHomeViewController* _instance;

@synthesize chromecastFinder, chromecastManager, mediaListFinder;

+ (CIHomeViewController *) instance{
    return _instance;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    _instance = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CIHomeView *view = (CIHomeView*)[self view];
    [view applyStyle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) searchForChromeCasts:(CIButton *)sender{
    NSLog(@"I'm Searching for Chrome Casts");
    if ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != ReachableViaWiFi) {
        CIAlertView *updateAlert = [[CIAlertView alloc] initWithTitle:[NSString wifiAlertTitle]
                                                              message:[NSString wifiChromecastAlertMessage]
                                                    cancelButtonTitle:[NSString wifiAlertOkayTitle]
                                                    otherButtonTitles: nil];
        
        [updateAlert showWithDismissHandler:^(NSInteger selectedIndex, BOOL didCancel){}];
    }
    else {
        //Set up the Table View
        CIHomeView *view = (CIHomeView*) [self view];
        [view perpareViewForChromecastDeviceListing];
        
        if (chromecastFinder == nil){
            CIContentView *chromecastContentView = [view chromeCastsView];
            CITableView *chromecastDeviceListTable = [chromecastContentView tableView];
            chromecastFinder = [[CIChromecastFinder alloc] initWithTableView:chromecastDeviceListTable];
            [chromecastDeviceListTable createDataDelegateWithDataSource:chromecastFinder];
        }
        
        [chromecastFinder scanForDevices];
        
        //Set up the Spinning Icon
        //Fade out the Placeholder and Fade in the table View
        [UIView animateWithDuration:0.5 animations:^(void) {
            sender.alpha = 0;
        } completion:^(BOOL finished) {
            if (finished){
                // Put here the code that you want to execute when the animation finishes
                [view displayChromecastTable];
            }
        }];
    }
}

- (IBAction) searchForMediaLocations:(CIButton*) sender{
    NSLog(@"I'm Searching for Media Locations");
    
    if ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != ReachableViaWiFi) {
        CIAlertView *updateAlert = [[CIAlertView alloc] initWithTitle:[NSString wifiAlertTitle]
                                                              message:[NSString wifiMediaAlertMessage]
                                                    cancelButtonTitle:[NSString wifiAlertOkayTitle]
                                                    otherButtonTitles: nil];
        
        [updateAlert showWithDismissHandler:^(NSInteger selectedIndex, BOOL didCancel){}];
    }
    else {
        if (mediaListFinder == nil){
            mediaListFinder = [[CIMediaDeviceFinder alloc] init];
            [mediaListFinder startScan];
        }
        
        if ([sender buttonStyle] == ciMediaListButton){
            [UIView animateWithDuration:1.0 animations:^(void) {
                sender.alpha = 0;
            }];
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
