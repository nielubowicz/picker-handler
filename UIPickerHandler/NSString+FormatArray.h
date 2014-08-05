//
//  NSString+FormatArray.h
//  SafetyNet
//
//  Created by chris nielubowicz on 8/5/14.
//  Copyright (c) 2014 Assorted Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FormatArray)

+ (id)stringWithFormat:(NSString *)format array:(NSArray *)arguments;

@end
