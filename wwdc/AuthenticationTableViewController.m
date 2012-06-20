//
//  AuthenticationTableViewController.m
//  wwdc
//
//  Created by Chris Lowe on 6/19/12.
//  Copyright (c) 2012 Hashtag Studios. All rights reserved.
//

#import "AuthenticationTableViewController.h"

@implementation AuthenticationTableViewController

@synthesize authenticationButton;
@synthesize emailTextField;
@synthesize passwordTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.emailTextField becomeFirstResponder];
}

- (void)viewDidUnload
{
    [self setAuthenticationButton:nil];
    [self setEmailTextField:nil];
    [self setPasswordTextField:nil];
    [super viewDidUnload];
}

// didSelectRowAtIndexPath is here just as a 'nice to have' to auto select the correct field
// this way, the user doesnt have to find the correct text field bounds
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self.emailTextField becomeFirstResponder];
            break;
        case 1:
            [self.passwordTextField becomeFirstResponder];
            break;
        default:
            break;
    }
}

// Our 'Sign Up' and 'Log In' buttons are disabled until we have sufficient information
// Here we dont do any field validation (such as stripping characters - some will get fixed in URL-encoding, others will be caught server-side)
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.emailTextField.text.length > 0 &&
        self.passwordTextField.text.length > 0) {
        self.authenticationButton.enabled = YES;
    }

    return YES;
}

// 'Nice to have' for dismissing the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

// Subclasses will over-ride and implement specific logic
- (IBAction)loginOrSignUpButtonSelected:(id)sender {
    // This method intentionally left blank
}

@end
