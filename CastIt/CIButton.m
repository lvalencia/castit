//
//  CIButton.m
//  CastIt
//
//  Created by Luis Valencia on 3/26/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIButton.h"
#import "CIContentView.h"

@interface CIButton()

- (enum CIContentViewType) getTypeOfContainingContentView;

@end

@implementation CIButton

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

    switch ([self getTypeOfContainingContentView]) {
        case ciChromeCastView:{
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 60, 0, 0)];
            [self setTitle:[NSString chromecastContentInstructions] forState:UIControlStateNormal];
        }
            break;
        case ciMediaListView:{
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, 48, 0, 0)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 70, 0, 0)];
            [self setTitle:[NSString mediaListContentInstructions] forState:UIControlStateNormal];
            [self.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
            [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        }
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
- (enum CIContentViewType) getTypeOfContainingContentView{
    id contentView = [self superview];
    while (![contentView isKindOfClass:[CIContentView class]]){
        contentView = [contentView superview];
        if (contentView == nil)
            return -1;
    }
    return [(CIContentView*)contentView contentType];
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
