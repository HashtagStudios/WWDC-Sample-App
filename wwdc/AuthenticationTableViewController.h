//
//  AuthenticationTableViewController.h
//  wwdc
//
//  Created by Chris Lowe on 6/19/12.
//  Copyright (c) 2012 Hashtag Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketStatusTableViewController.h"

typedef enum {
    kSignUpEmailField       = 100,
    kSignUpPasswordField    = 101,
    kSSignUptatusField      = 102,
    kLogInEmailField        = 200,
    kLogInPasswordField     = 201,
} AuthenticationTableFields;

@interface AuthenticationTableViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *authenticationButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginOrSignUpButtonSelected:(id)sender;

@end
