//
//  ViewController.h
//  JMLoginForm
//
//  Created by Jad Messadi on 14/07/2017.
//  Copyright © 2017 Jad Messadi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@property (strong, nonatomic) IBOutlet UIButton *loginButton;


@end
