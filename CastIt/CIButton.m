//
//  CIButton.m
//  CastIt
//
//  Created by Luis Valencia on 3/26/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIButton.h"
#import "CIContentView.h"

@implementation CIButton

@synthesize buttonStyle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) applyStyle{
    UIColor* buttonTextColor =[UIColor contentSectionTextColor];
    UIFont* buttonFont = [UIFont contentSectionTypeface];

    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self setTitleColor:buttonTextColor forState:UIControlStateNormal];
    [self.titleLabel setFont:buttonFont];
   
    switch (buttonStyle) {
        case ciChromeCastRefreshButton:{
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 60, 30, 0)];
            [self setTitle:[NSString chromecastContentInstructions] forState:UIControlStateNormal];
            
            UIImage *backgroundImage = [UIImage refresh];
            CGRect frame = CGRectMake(148, 55, 17, 16);
            UIView *subView = [[UIView alloc] initWithFrame:frame];
            UIColor *backgroundColor = [[UIColor alloc] initWithPatternImage:backgroundImage];
            subView.backgroundColor = backgroundColor;
            [self insertSubview:subView atIndex:0];
            
            CILabel *subtitle = [[CILabel alloc] initWithFrame:CGRectMake(170, 53, 112, 18)];
            [subtitle setLabelStyle:[self class]];
            [subtitle applyStyle];
            [self addSubview:subtitle];
            
        }
            break;
        case ciMediaListButton:{
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, 48, 0, 0)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 70, 0, 0)];
            [self setTitle:[NSString mediaListContentInstructions] forState:UIControlStateNormal];
            [self.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
            [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        }
            break;
        case ciWebsiteButton:
            [self setTitle:[NSString webURL] forState:UIControlStateNormal];
        case ciFAQbutton:{
            buttonTextColor =[UIColor buttonTextColor];
            buttonFont = [UIFont footerTypeface];
            [self setTitleColor:buttonTextColor forState:UIControlStateNormal];
            [self.titleLabel setFont:buttonFont];
        }
            break;
        case ciAddLocation:
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, 17, 0, 0)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 25, 1, 0)];
            
            buttonTextColor =[UIColor buttonTextColor];
            buttonFont = [UIFont headerButtonTypeface];
            [self setTitleColor:buttonTextColor forState:UIControlStateNormal];
            [self setTitleColor:[buttonTextColor colorByChangingAlphaTo:0.2] forState:UIControlStateHighlighted];
            [self.titleLabel setFont:buttonFont];
            [self setImage:[[UIImage add] imageByApplyingAlpha:0.2] forState:UIControlStateHighlighted];
            [self setBackgroundColor:[UIColor mainBackgroundColor]];
            
            self.layer.borderColor = [UIColor mainBackgroundColor].CGColor;
            self.layer.borderWidth = 0.5f;
            self.layer.cornerRadius = 5;
            
            [self setTitle:[NSString headerButtonText] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    
    NSDictionary* normalAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                      buttonFont, NSFontAttributeName,
                                      buttonTextColor, NSForegroundColorAttributeName,
                                      nil];
    
    CGSize requiredSize = [[self titleForState:UIControlStateNormal] sizeWithAttributes:normalAttributes];
    [self sizeThatFits:requiredSize];
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
