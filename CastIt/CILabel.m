//
//  CILabel.m
//  CastIt
//
//  Created by Luis Valencia on 3/26/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CILabel.h"
#import "CIContentView.h"
#import "CIHomeView.h"

@interface CILabel()

- (CIContentHeader *) containingHeaderForLabel;

@end

@implementation CILabel

@synthesize labelStyle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) applyStyle{
    if (labelStyle == [CIContentHeader class]){
        [self setTextColor:[UIColor contentSectionTextColor]];
        [self setFont:[UIFont headerSectionTypeface]];
        [self setText:[NSString stringForHeader:[self containingHeaderForLabel]]];
    }
    else if (labelStyle == [CIHomeView class]){
        
    }
}

#pragma mark - private methods

- (CIContentHeader *) containingHeaderForLabel{
    id header = [self superview];
    while (![header isKindOfClass:[CIContentHeader class]]){
        header = [header superview];
        if (header == nil)
            return nil;
    }
    return (CIContentHeader*)header;
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
