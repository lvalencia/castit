//
//  NSURL+Links.m
//  CastIt
//
//  Created by Luis Valencia on 4/1/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "NSURL+Links.h"

@implementation NSURL (Links)

+ (NSURL *) webURL { return [NSURL URLWithString:@"http://www.cast.it"];    }
+ (NSURL *) FAQURL { return [NSURL URLWithString:@"http://www.cast.it/faq"];}

@end
