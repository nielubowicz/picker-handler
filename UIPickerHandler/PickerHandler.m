//
//  PickerHandler.m
//  SafetyNet
//
//  Created by chris nielubowicz on 8/5/14.
//  Copyright (c) 2014 Assorted Intelligence. All rights reserved.
//

#import "PickerHandler.h"
#import "NSString+FormatArray.h"

@implementation PickerHandler

-(id)initWithTextField:(UITextField *)textField objects:(NSArray *)dataArray;
{
    if (self = [super init])
    {
        UIPickerView *picker = [[UIPickerView alloc] init];
        [picker setShowsSelectionIndicator:YES];
        [textField setInputView:picker];
        [self setPickerView:picker];
        [self setTextField:textField];
        _dataArray = dataArray;
        
        [picker setDataSource:self];
        [picker setDelegate:self];
    }
    return self;
}

-(BOOL)hasMultipleComponents
{
    return [[_dataArray firstObject] isKindOfClass:[NSArray class]];
}

#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if ([self hasMultipleComponents])
    {
        return _dataArray.count;
    }
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([self hasMultipleComponents])
    {
        return [[_dataArray objectAtIndex:component] count];
    }
    return _dataArray.count;
}

#pragma mark UIPickerViewDelegate<NSObject>
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    if ([self hasMultipleComponents])
    {
        return [[_dataArray objectAtIndex:component] objectAtIndex:row];
    }
    return [_dataArray objectAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;
{
    NSArray *objectsToCheck = nil;
    if ([self hasMultipleComponents])
    {
        objectsToCheck = [_dataArray objectAtIndex:component];
    }
    else
    {
        objectsToCheck = _dataArray;
    }
    
    __block CGFloat longestWidth = 0;
    [objectsToCheck enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
       CGSize size = [obj sizeWithFont:[UIFont systemFontOfSize:48]];
       if (size.width > longestWidth)
       {
           longestWidth = size.width;
       }
    }];
    
    if ([self hasMultipleComponents])
    {
        return (longestWidth > pickerView.frame.size.width/_dataArray.count ? pickerView.frame.size.width/_dataArray.count : longestWidth);
    }
    
    return (longestWidth > pickerView.frame.size.width ? pickerView.frame.size.width : longestWidth);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([self hasMultipleComponents])
    {
        __block NSMutableArray *array = [NSMutableArray array];
        [_dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
            [array addObject:[obj objectAtIndex:[pickerView selectedRowInComponent:idx]]];
        }];
        dispatch_async(dispatch_get_main_queue(), ^() {
            [[self textField] setText:[NSString stringWithFormat:[self formatString] array:array]];
        });
    }
    else
    {
        [[self textField] setText:[_dataArray objectAtIndex:row]];
    }
}

@end
