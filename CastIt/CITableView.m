//
//  CITableView.m
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CITableView.h"

@implementation CITableView

@synthesize dataSourceDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) createDataDelegateWithDataSource:(id) dataSourceObject{
    if (dataSourceDelegate == nil){
        dataSourceDelegate = [[CIDataSourceHandler alloc] initWithDataSourceObject:dataSourceObject];
    }
    else {
        [dataSourceDelegate setDataSourceObject:nil];
        [dataSourceDelegate setDataSourceObject:dataSourceObject];
    }
}

- (void) applyStyle {
    
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
