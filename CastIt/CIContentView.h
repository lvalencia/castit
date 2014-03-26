//
//  CIContentView.h
//  CastIt
//
//  Created by Luis Valencia on 3/26/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIView.h"
#import "CILabel.h"

enum CIContentViewType {
    ciChromeCastView = 0,
    ciMediaListView
};

@interface CIContentHeader : CIView<CIStyleable>

@property (nonatomic) enum CIContentViewType headerType;
@property (nonatomic, strong) IBOutlet CILabel* headerTitle;

@end

@interface CIContentView : CIView<CIStyleable>

@property (nonatomic, strong) IBOutlet CIContentHeader* contentHeader;
@property (nonatomic) enum CIContentViewType contentType;

@end
