//
//  NSArray+FileSharingProtocols.m
//  CastIt
//
//  Created by Luis Valencia on 8/7/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "NSArray+FileSharingProtocols.h"
#import "NSArray+Utils.h"

@implementation NSArray (FileSharingProtocols)

+ (NSArray *) windowsProtocols {
    return [NSArray arrayWithObjects:@"_cifs._tcp.", @"_smb._tcp", nil];
}
+ (NSArray *) netwareProtocols{
    return [NSArray arrayWithObjects:@"_ncp._tcp.", nil];
}
+ (NSArray *) nixProtocols {
    return [NSArray arrayWithObjects:@"_nfs._tcp.", @"_nfs._udp.", nil];
}
+ (NSArray *) macProtocols {
    return [NSArray arrayWithObjects:@"_afpovertcp._tcp", @"_afp._tcp", nil];
}
+ (NSArray *) allProtocols {
    return [NSArray arrayFromArrays:[self windowsProtocols], [self netwareProtocols], [self nixProtocols], [self macProtocols], nil];
}

@end
