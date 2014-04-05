//
//  CITableViewCell.m
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CITableViewCell.h"

@interface CITableViewCell()

- (void) applySelectedStyle;
- (void) setSelectedChromecastLogo;
- (void) applyUnselectedStyle;
- (void) setUnselectedChromecastLogo;

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
    
    if ([self.imageView image] == nil){
        NSArray *connectingAnimationArray = [UIImage connectingAnimationArray];
        [self.imageView setImage:[connectingAnimationArray objectAtIndex:0]];
        [self.imageView setAnimationDuration:0.8];
        [self.imageView setAnimationImages:connectingAnimationArray];
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
}

- (void) applyUnselectedStyle {
    [self.contentView setBackgroundColor:[UIColor tableViewBackgroundColor]];
    [self.textLabel setBackgroundColor:[UIColor tableViewBackgroundColor]];
    [self.textLabel setTextColor:[UIColor unselectedTabelCellTextColor]];
    [self setUnselectedChromecastLogo];
    [self addSubview:chromecastLogo];
    [self.imageView setImage:nil];
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


@end
