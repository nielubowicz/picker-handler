//
//  PickerHandler.h
//  SafetyNet
//
//  Created by chris nielubowicz on 8/5/14.
//  Copyright (c) 2014 Assorted Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIPickerView.h>

@interface PickerHandler : NSObject<UIPickerViewDataSource,UIPickerViewDelegate>

-(id)initWithTextField:(UITextField *)textField objects:(NSArray *)dataArray;

@property (strong,nonatomic)UIPickerView *pickerView;
@property (strong,nonatomic)UITextField *textField;
@property (strong,nonatomic,readonly)NSArray *dataArray;
@property (strong,nonatomic)NSString *formatString;

@end
