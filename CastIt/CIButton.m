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

- (CIContentView *) getContainingContentView;
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

- (CIContentView *) getContainingContentView {
    id contentView = [self superview];
    while (![contentView isKindOfClass:[CIContentView class]]){
        contentView = [contentView superview];
        if (contentView == nil)
            return nil;
    }
    return (CIContentView*)contentView;
}

- (enum CIContentViewType) getTypeOfContainingContentView{
    CIContentView *view = [self getContainingContentView];
    return (view != nil) ? [view contentType] : -1;
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
