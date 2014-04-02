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
- (void) applyUnselectedStyle;

@end

@implementation CITableViewCell

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
}
- (void) applyUnselectedStyle {
    [self.contentView setBackgroundColor:[UIColor tableViewBackgroundColor]];
    [self.textLabel setBackgroundColor:[UIColor tableViewBackgroundColor]];
}

@end
