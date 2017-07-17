//
//  ViewController.m
//  JMLoginForm
//
//  Created by Jad Messadi on 14/07/2017.
//  Copyright © 2017 Jad Messadi. All rights reserved.
//


#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.loginButton.layer.cornerRadius = 5.0;
    self.loginButton.clipsToBounds = YES;
    
    NSAttributedString *emailAtt = [[NSAttributedString alloc] initWithString:@"Nom d'utilisateur / Email" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:138.0/255.0 green:135.0/255.0 blue:132.0/255.0 alpha:1.0] }];
    self.emailTextField.attributedPlaceholder = emailAtt;
    NSAttributedString *passwordAtt = [[NSAttributedString alloc] initWithString:@"Mot de passe" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:138.0/255.0 green:135.0/255.0 blue:132.0/255.0 alpha:1.0] }];
    self.passwordTextField.attributedPlaceholder = passwordAtt;
    
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameDidChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
 
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self.emailTextField setText:nil];
    [self.passwordTextField setText:nil];
    
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    
    [self.view endEditing:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardFrameDidChange:(NSNotification *)notification
{
    CGRect keyboardEndFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect keyboardBeginFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    UIViewAnimationCurve animationCurve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] integerValue];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    CGRect newFrame = self.view.frame;
    CGRect keyboardFrameEnd = [self.view convertRect:keyboardEndFrame toView:nil];
    CGRect keyboardFrameBegin = [self.view convertRect:keyboardBeginFrame toView:nil];
    
    newFrame.origin.y -= (keyboardFrameBegin.origin.y - keyboardFrameEnd.origin.y);
    self.view.frame = newFrame;
    
    [UIView commitAnimations];
}

- (IBAction)onLoginPressed:(id)sender {
    [self.view endEditing:YES];

}

- (IBAction)onForgotPasswordPressed:(id)sender {
    [self.view endEditing:YES];

}

- (IBAction)onSignUpPressed:(id)sender {
    [self.view endEditing:YES];

}

- (IBAction)onInfoPressed:(id)sender {
    [self.view endEditing:YES];

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.emailTextField) {
        [self.passwordTextField becomeFirstResponder];
    }
    else if (textField == self.passwordTextField){
        [self.view endEditing:YES];
        [self onLoginPressed:nil];
    }
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end

