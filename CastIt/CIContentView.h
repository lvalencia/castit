//
//  CIContentView.h
//  CastIt
//
//  Created by Luis Valencia on 3/26/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIView.h"
#import "CILabel.h"
#import "CIButton.h"
#import "CITableView.h"

enum CIContentViewType {
    ciChromeCastView = 1,
    ciMediaListView
};

@interface CIContentHeader : CIView<CIStyleable>

@property (nonatomic) enum CIContentViewType headerType;
@property (nonatomic, strong) IBOutlet CILabel *headerTitle;
@property (nonatomic, strong) IBOutlet CIButton *headerButton;

@end

@interface CIContentView : CIView<CIStyleable>

@property (nonatomic, strong) IBOutlet CIContentHeader* contentHeader;
@property (nonatomic, strong) IBOutlet CIButton *placeholderContent;
@property (nonatomic) CITableView *tableView;
@property (nonatomic) enum CIContentViewType contentType;

- (void) prepareTableForViewing;
- (void) showTable;

@end
