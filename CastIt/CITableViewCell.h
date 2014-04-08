//
//  CITableViewCell.h
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CIStyleable.h"
#import "CIIndicator.h"

@interface CITableViewCell : UITableViewCell<CIStyleable, CIIndicator>{
    CGRect logoRect;
}

@property (nonatomic, strong) UIImageView *chromecastLogo;
@property (nonatomic, strong) NSTimer *connectionTimer;

@end
