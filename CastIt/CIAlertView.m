//
//  CIAlertView.m
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIAlertView.h"

@interface CIAlertView() <UIAlertViewDelegate>

@property (strong, nonatomic) CIAlertView *strongAlertReference;
@property (copy) AlertDismissedHandler activeDismissHandler;
@property (strong, nonatomic) NSString *activeTitle;
@property (strong, nonatomic) NSString *activeMessage;
@property (strong, nonatomic) NSString *activeCancelTitle;
@property (strong, nonatomic) NSString *activeOtherTitles;
@property (strong, nonatomic) UIAlertView *activeAlert;

@end

@implementation CIAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithTitle:(NSString *)aTitle message:(NSString *)aMessage cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSString *)otherTitles,... {
    self = [super init];
    if (self) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:aTitle message:aMessage delegate:self cancelButtonTitle:aCancelTitle otherButtonTitles:nil];
        if (otherTitles != nil) {
            [alert addButtonWithTitle:otherTitles];
            va_list args;
            va_start(args, otherTitles);
            NSString * title = nil;
            while((title = va_arg(args,NSString*))) {
                [alert addButtonWithTitle:title];
            }
            va_end(args);
        }
        self.activeAlert = alert;
    }
    return self;
}

- (void) setAlertViewStyle:(UIAlertViewStyle)alertViewStyle
{
    [self.activeAlert setAlertViewStyle:alertViewStyle];
}
- (NSString*) textFromInputTextField
{
    if(self.activeAlert.alertViewStyle == UIAlertViewStylePlainTextInput)
        return [self.activeAlert textFieldAtIndex:0].text;
    return @"";
}
- (void) setTextFieldText:(NSString*) text
{
    if(self.activeAlert.alertViewStyle == UIAlertViewStylePlainTextInput)
    {
        UITextField* renameTextField = [self.activeAlert textFieldAtIndex:0];
        renameTextField.text = text;
    }
}

- (void)showWithDismissHandler:(AlertDismissedHandler)handler {
    self.activeDismissHandler = handler;
    self.strongAlertReference = self;
    [self.activeAlert show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.activeDismissHandler) {
        self.activeDismissHandler(buttonIndex,buttonIndex == alertView.cancelButtonIndex);
    }
    self.strongAlertReference = nil;
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
