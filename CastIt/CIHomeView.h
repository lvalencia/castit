//
//  CIHomeView.h
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "CIView.h"
#import "CIContentView.h"

@interface CIHomeView : CIView<CIStyleable>

@property (nonatomic, strong) IBOutlet UIImageView *castItHeader;
@property (nonatomic, strong) IBOutlet CIContentView *chromeCastsView;
@property (nonatomic, strong) IBOutlet CIContentView *mediaLocationsView;

@end
