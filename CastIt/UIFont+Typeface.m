//
//  UIFont+Typeface.m
//  CastIt
//
//  Created by Luis Valencia on 3/25/14.
//  Copyright (c) 2014 Luis Valencia. All rights reserved.
//

#import "UIFont+Typeface.h"

@implementation UIFont (Typeface)

+ (UIFont *) headerSectionTypeface              { return [UIFont fontWithName:@"OpenSans"       size:14.0f]; }
+ (UIFont *) headerButtonTypeface               { return [UIFont fontWithName:@"OpenSans-Light" size:12.0f]; }
+ (UIFont *) contentSectionTypeface             { return [UIFont fontWithName:@"OpenSans-Light" size:20.0f]; }
+ (UIFont *) contentSectionHighlightedTypeface  { return [UIFont fontWithName:@"OpenSans-Bold"  size:15.0f]; }
+ (UIFont *) footerTypeface                     { return [UIFont fontWithName:@"OpenSans-Bold"  size:12.0f]; }

+ (void) listSupportedFonts {
    for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@", family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName: family])
        {
            NSLog(@"  %@", name);
        }
    }
}

@end
