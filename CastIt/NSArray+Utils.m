//
//  NSArray+Utils.m
//  CastIt
//
//  Created by Luis Valencia on 8/7/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "NSArray+Utils.h"

@implementation NSArray (Utils)

+ (NSArray *) arrayFromArrays:(NSArray *)otherArrays,... {
    NSMutableArray* result = [[NSMutableArray alloc] initWithArray:otherArrays];
    va_list args;
    va_start(args, otherArrays);
    NSArray *next;
    while((next = va_arg(args, NSArray*))) {
        [result addObjectsFromArray:next];
    }
    va_end(args);
    return result;
}

@end
