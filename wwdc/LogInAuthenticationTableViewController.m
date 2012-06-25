//
//  LogInAuthenticationTableViewController.m
//  wwdc
//
//  Created by Chris Lowe on 6/19/12.
//  Copyright (c) 2012 Hashtag Studios. All rights reserved.
//

#import "LogInAuthenticationTableViewController.h"
#import "ASIFormDataRequest.h"
@interface LogInAuthenticationTableViewController ()
@property (nonatomic, strong) NSDictionary *ticketDict;
@end

@implementation LogInAuthenticationTableViewController
@synthesize ticketDict;

- (IBAction)loginOrSignUpButtonSelected:(id)sender {
    NSLog(@"Logging In...");
    
    NSURL *url = [NSURL URLWithString:@"http://www.amigoingtowwdc.com/index.php"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:@"testuser" forKey:@"rw_user_name"];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
 
    NSLog(@"** Got URL Code: %i with data: %@", request.responseStatusCode, [request responseString]);
    NSData *data = [[request responseString] dataUsingEncoding:NSUTF8StringEncoding];
    self.ticketDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    [self performSegueWithIdentifier:@"userAuthenticatedSegue" sender:self];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TicketStatusTableViewController *ticketStatusViewController = segue.destinationViewController;
    ticketStatusViewController.ticketDetails = self.ticketDict;
}

@end
