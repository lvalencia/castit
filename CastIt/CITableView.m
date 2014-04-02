//
//  CITableView.m
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CITableView.h"
#import "CITableViewCell.h"
#import "NSString+Identifiers.h"

@implementation CITableView

@synthesize dataSourceDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setDelegate:self];
        [self registerClass: [CITableViewCell class] forCellReuseIdentifier:[NSString ciTableViewCellReusableIdentifier]];
    }
    return self;
}

- (void) createDataDelegateWithDataSource:(id) dataSourceObject{
    if (dataSourceDelegate == nil){
        dataSourceDelegate = [[CIDataSourceHandler alloc] initWithDataSourceObject:dataSourceObject];
        [self setDataSource:dataSourceDelegate];
    }
    else {
        [dataSourceDelegate setDataSourceObject:nil];
        [dataSourceDelegate setDataSourceObject:dataSourceObject];
        [self setDataSourceDelegate:nil];
        [self setDataSource:dataSourceDelegate];
    }
}

- (void) applyStyle {
    [self setBackgroundColor:[UIColor tableViewBackgroundColor]];
    [self setSeparatorColor:[UIColor tableSeperatorInsetColor]];
    [self setSeparatorInset:UIEdgeInsetsZero];
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
