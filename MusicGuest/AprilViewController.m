//
//  AprilViewController.m
//  MusicGuest
//
//  Created by April Coder on 10/26/13.
//  Copyright (c) 2013 April Coder. All rights reserved.
//

#import "AprilViewController.h"

@interface AprilViewController ()

@end

@implementation AprilViewController
@synthesize scrollView;
@synthesize answerTextField;
@synthesize musicData;
@synthesize imageView1;
@synthesize imageView2;
@synthesize imageView3;
@synthesize imageView4;

#define kPositionBetweenTextFieldAndKeyBoard 15

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /* Initialize */
    imageView1 = (UIImageView *)[self.view viewWithTag:500];
    imageView2 = (UIImageView *)[self.view viewWithTag:501];
    imageView3 = (UIImageView *)[self.view viewWithTag:502];
    imageView4 = (UIImageView *)[self.view viewWithTag:503];
    
    imageView1.image = [UIImage imageNamed:@"1622645_large.jpg"];
    imageView2.image = [UIImage imageNamed:@"1622645_large.jpg"];
    imageView3.image = [UIImage imageNamed:@"1622645_large.jpg"];
    imageView4.image = [UIImage imageNamed:@"1622645_large.jpg"];
    
    /* create input field = length text */
    // Ex: Demo
    NSString *demo = @"Demo";
    for(int i = 0; i< [demo length]; i++){
        UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(50 + i*50, 400, 50, 50)];
        textfield.borderStyle = UITextBorderStyleNone;
        textfield.background = [UIImage imageNamed:@"imageCharacterTitle.jpg"];
        textfield.tag = 300 + i;
        textfield.delegate = self;
        //[self.scrollView addSubview:textfield];
    }
    
    answerTextField.delegate = self;
    answerTextField.borderStyle = UITextBorderStyleNone;
    answerTextField.background = [UIImage imageNamed:@"input_focused.png"];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    /* Load data*/
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"Music" ofType:@"plist"];
    musicData = [NSArray arrayWithContentsOfFile:plistPath];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)keyboardWasShown:(NSNotification *)notification
{
    
    // Step 1: Get the size of the keyboard.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    // Step 2: Change position of View
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    
    // Step 3: Scroll position of TextField
    CGPoint scrollPoint = CGPointMake(0.0, self.answerTextField.frame.origin.y - (keyboardSize.height-kPositionBetweenTextFieldAndKeyBoard));
    [scrollView setContentOffset:scrollPoint animated:YES];
}

- (void) keyboardWillHide:(NSNotification *)notification {
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
}

// Set activeTextField to the current active textfield

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.answerTextField = textField;
}

// Set activeTextField to nil

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.answerTextField = nil;
}


// Dismiss the keyboard
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [self.answerTextField resignFirstResponder];
    return YES;
}
/*
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    int currentTag = textField.tag;
    UITextField *nextTextField = (UITextField *)[self.scrollView viewWithTag:currentTag +1];
    [textField resignFirstResponder];
    [nextTextField becomeFirstResponder];
    return (newLength > 1) ? NO : YES;
}
*/
- (IBAction)dismissKeyboard:(id)sender
{
    [self.answerTextField resignFirstResponder];
}

@end
