//
//  AprilViewController.h
//  MusicGuest
//
//  Created by April Coder on 10/26/13.
//  Copyright (c) 2013 April Coder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AprilViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIView *viewBG;
@property (nonatomic, weak) IBOutlet UITextField *answerTextField;
@property (nonatomic, weak) IBOutlet UIImageView *imageView1;
@property (nonatomic, weak) IBOutlet UIImageView *imageView2;
@property (nonatomic, weak) IBOutlet UIImageView *imageView3;
@property (nonatomic, weak) IBOutlet UIImageView *imageView4;
@property (nonatomic, strong) NSArray *musicData;
- (IBAction)dismissKeyboard:(id)sender;
@end
