//
//  ViewController.m
//  UIPickerHandler
//
//  Created by chris nielubowicz on 8/5/14.
//  Copyright (c) 2014 Assorted Intelligence. All rights reserved.
//

#import "ViewController.h"
#import "PickerHandler.h"

@interface ViewController ()
{
    PickerHandler *adjectiveHandler;
    PickerHandler *nounHandler;
    PickerHandler *verbHandler;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    adjectiveHandler = [[PickerHandler alloc] initWithTextField:[self adjectives]
                                                       objects:@[@"Large",@"Slow",@"Boastful",@"Trepidatious",@"Curmudgeonly",@"Encumbered",@"Vociferous"]];
    
    nounHandler = [[PickerHandler alloc] initWithTextField:[self nouns]
                                                   objects:@[@"Lorax",@"Tree",@"Car",@"Boulder",@"Airplane",@"Bear",@"Orchid"]];
    
    verbHandler = [[PickerHandler alloc] initWithTextField:[self verbs]
                                                   objects:@[                                                             @[@"Ran",@"Drove",@"Swam",@"Bounded",@"Exploded",@"Computed",@"Adventured",@"Explored",@"Brushed",@"Curled",@"Mastered"],                                                             @[@"Ran",@"Drove",@"Swam",@"Bounded",@"Exploded",@"Computed",@"Adventured",@"Explored",@"Brushed",@"Curled",@"Mastered"]]];
    [verbHandler setFormatString:@"%@ then %@"];
}

-(IBAction)buttonClicked:(id)sender
{
    [[self verbs] resignFirstResponder];
    [[self nouns] resignFirstResponder];
    [[self adjectives] resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
