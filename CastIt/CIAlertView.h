//
//  CIAlertView.h
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertDismissedHandler) (NSInteger selectedIndex, BOOL didCancel);

@interface CIAlertView : UIAlertView

- (id)initWithTitle:(NSString *)aTitle message:(NSString *)aMessage cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSString *)otherTitles,...NS_REQUIRES_NIL_TERMINATION;
- (void)showWithDismissHandler:(AlertDismissedHandler)handler;

- (void) setAlertViewStyle:(UIAlertViewStyle)alertViewStyle;
- (NSString*) textFromInputTextField;
- (void) setTextFieldText:(NSString*) text;

@end
