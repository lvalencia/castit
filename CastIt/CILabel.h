//
//  CILabel.h
//  CastIt
//
//  Created by Luis Valencia on 3/26/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CIStyleable.h"

@interface CILabel : UILabel<CIStyleable>

@property (nonatomic) Class labelType;

@end
