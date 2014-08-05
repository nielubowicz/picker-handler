//
//  NSString+FormatArray.m
//  SafetyNet
//
//  Created by chris nielubowicz on 8/5/14.
//  Copyright (c) 2014 Assorted Intelligence. All rights reserved.
//

#import "NSString+FormatArray.h"

@implementation NSString (FormatArray)

+ (id)stringWithFormat:(NSString *)format array:(NSArray *)arguments
{
    NSRange range = NSMakeRange(0, [arguments count]);
    NSMutableData *data = [NSMutableData dataWithLength:sizeof(id) * [arguments count]];
    [arguments getObjects:(__unsafe_unretained id *)data.mutableBytes range:range];
    NSString *result = [[NSString alloc] initWithFormat:format arguments:data.mutableBytes];
    return result;
}

@end
