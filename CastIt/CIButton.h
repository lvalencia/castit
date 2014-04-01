//
//  CIButton.h
//  CastIt
//
//  Created by Luis Valencia on 3/26/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CIStyleable.h"

@class CIContentView;

enum CIButtonType {
    ciWebsiteButton = 1,
    ciFAQbutton,
    ciAddLocation
};

@interface CIButton : UIButton<CIStyleable>

@property (nonatomic) Class buttonStyle;
@property (nonatomic) enum CIButtonType type;

@end
