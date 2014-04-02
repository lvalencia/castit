//
//  CITableView.h
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CIDataSourceHandler.h"
#import "CIStyleable.h"

@interface CITableView : UITableView<CIStyleable>

@property (nonatomic, strong) CIDataSourceHandler *dataSourceDelegate;

- (void) createDataDelegateWithDataSource:(id) dataSourceObject;

@end
