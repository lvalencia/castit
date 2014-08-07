//
//  CIDataSourceHandler.m
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIDataSourceHandler.h"
#import "CIChromecastFinder.h"
#import "CIMediaDeviceFinder.h"
#import "CITableViewCell.h"
#import "NSString+Identifiers.h"

#define numberOfSectionsForTable 1

@implementation CIDataSourceHandler

@synthesize dataSourceObject;

- (id) initWithDataSourceObject: (id) dataSourceObj{
    self = [super init];
    if (self){
        dataSourceObject = dataSourceObj;
    }
    return self;
}

#pragma mark - UITableViewDataSource Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return numberOfSectionsForTable;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = 0;
    if ([dataSourceObject isKindOfClass:[CIChromecastFinder class]]){
        CIChromecastFinder* finder = (CIChromecastFinder *)dataSourceObject;
        rows = [finder deviceCount];
    }
    else if ([dataSourceObject isKindOfClass:[CIMediaDeviceFinder class]]){
        CIMediaDeviceFinder* finder = (CIMediaDeviceFinder *)dataSourceObject;
        rows = [finder deviceCount];
    }
    return rows;
}

- (CITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = [NSString ciTableViewCellReusableIdentifier];
    CITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString ciTableViewCellReusableIdentifier] forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[CITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if ([dataSourceObject isKindOfClass:[CIChromecastFinder class]]){
        CIChromecastFinder* finder = (CIChromecastFinder *)dataSourceObject;
        GCKDevice* device = [finder deviceAtIndex:indexPath.row];
        [cell.textLabel setText:[device friendlyName]];
    }
    else if ([dataSourceObject isKindOfClass:[CIMediaDeviceFinder class]]){
        CIMediaDeviceFinder* finder = (CIMediaDeviceFinder *) dataSourceObject;
        NSNetService* service = [finder deviceAtIndex:indexPath.row];
        [cell.textLabel setText:[service name]];
    }
    [cell applyStyle];
    
    return cell;
}

@end
