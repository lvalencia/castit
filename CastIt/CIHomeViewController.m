//
//  CIHomeViewController.m
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIHomeViewController.h"
#import "CIHomeView.h"
#import "CIButton.h"
#import "CIAlertView.h"
#import "Reachability.h"

@interface CIHomeViewController ()

@end

@implementation CIHomeViewController

@synthesize chromecastFinder;

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
        if (chromecastFinder == nil){
            chromecastFinder = [[CIChromecastFinder alloc] init];
        }
        [chromecastFinder scanForDevices];
        
        //Set up the Table View
        //Set up the Spinning Icon
        //Fade out the Placeholder and Fade in the table View
        [UIView animateWithDuration:1.0 animations:^(void) {
            sender.alpha = 0;
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
