//
//  CITableViewCell.m
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CITableViewCell.h"
#import "CIContentView.h"

@interface CITableViewCell()

- (void) applySelectedStyle;
- (void) setSelectedChromecastLogo;
- (void) applyUnselectedStyle;
- (void) setUnselectedChromecastLogo;
- (void) configureAnimationImage;
- (void) startAnimationWithStartDelay:(double)delayInSeconds;
- (enum CIContentViewType) contentTypeForTableCell;

@end

@implementation CITableViewCell

@synthesize chromecastLogo;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    [self applyStyle];
}

- (void) applyStyle{
    [self.textLabel setFont:[UIFont tableViewCellTypeface]];
    logoRect = CGRectMake(274, 12, 28, 22);

    if ([self contentTypeForTableCell] == ciChromeCastView) {
        [self configureAnimationImage];
    }
    
    if (self.selected) {
        [self applySelectedStyle];
    }
    else {
        [self applyUnselectedStyle];
    }
}
- (void) applySelectedStyle {
    [self.contentView setBackgroundColor:[UIColor highlightedTableCellColor]];
    [self.textLabel setBackgroundColor:[UIColor highlightedTableCellColor]];
    [self.textLabel setTextColor:[UIColor selectedTableCellTextColor]];
    [self setSelectedChromecastLogo];
    [self addSubview:chromecastLogo];
    
    if ([self contentTypeForTableCell] == ciChromeCastView) {
        [self startAnimationWithStartDelay:0.2];
    }
}

- (void) applyUnselectedStyle {
    [self.contentView setBackgroundColor:[UIColor tableViewBackgroundColor]];
    [self.textLabel setBackgroundColor:[UIColor tableViewBackgroundColor]];
    [self.textLabel setTextColor:[UIColor unselectedTabelCellTextColor]];
    [self setUnselectedChromecastLogo];
    [self addSubview:chromecastLogo];
    
    if ([self contentTypeForTableCell] == ciChromeCastView) {
        [self.imageView stopAnimating];
        [self.imageView setImage:nil];
    }
}

- (void) setSelectedChromecastLogo{
    if (chromecastLogo == nil){
        [self setChromecastLogo:[[UIImageView alloc] initWithFrame:logoRect]];
        [chromecastLogo setImage:[UIImage chromecastIconUnselected]];
    }
    else {
        [chromecastLogo removeFromSuperview];
        [self setChromecastLogo:nil];
        [self setChromecastLogo:[[UIImageView alloc] initWithFrame:logoRect]];
        [chromecastLogo setImage:[UIImage chromecastIconSelected]];
    }
}

- (void) setUnselectedChromecastLogo{
    if (chromecastLogo == nil){
        [self setChromecastLogo:[[UIImageView alloc] initWithFrame:logoRect]];
        [chromecastLogo setImage:[UIImage chromecastIconSelected]];
    }
    else{
        [chromecastLogo removeFromSuperview];
        [self setChromecastLogo:nil];
        [self setChromecastLogo:[[UIImageView alloc] initWithFrame:logoRect]];
        [chromecastLogo setImage:[UIImage chromecastIconUnselected]];
    }
}

- (void) configureAnimationImage{
    if ([self.imageView image] == nil){
        NSArray *connectingAnimationArray = [UIImage connectingAnimationArray];
        [self.imageView setImage:[connectingAnimationArray objectAtIndex:0]];
        [self.imageView setAnimationDuration:0.8];
        [self.imageView setAnimationRepeatCount:INFINITY];
        [self.imageView setAnimationImages:connectingAnimationArray];
    }
}

- (void) startAnimationWithStartDelay:(double)delayInSeconds{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.imageView startAnimating];
    });
}

- (enum CIContentViewType) contentTypeForTableCell{
    id view = [self superview];
    while (![view isKindOfClass:[CIContentView class]]){
        view = [view superview];
        if (view == nil)
            return -1;
    }
    return [(CIContentView*)view contentType];
}


@end
