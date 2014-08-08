//
//  NSArray+FileSharingProtocols.h
//  CastIt
//
//  Created by Luis Valencia on 8/7/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FileSharingProtocols)

+ (NSArray *) windowsProtocols;
+ (NSArray *) netwareProtocols;
+ (NSArray *) nixProtocols;
+ (NSArray *) macProtocols;
+ (NSArray *) allProtocols;
+ (NSArray *) arrayFromArrays:(NSArray *)otherArrays,...;
@end
