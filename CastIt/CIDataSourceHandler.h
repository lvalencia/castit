//
//  CIDataSourceHandler.h
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CIDataSourceHandler : NSObject<UITableViewDataSource>

@property (nonatomic, strong) id dataSourceObject;

- (id) initWithDataSourceObject: (id) dataSourceObj;

@end
