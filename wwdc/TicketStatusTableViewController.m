//
//  TicketStatusTableViewController.m
//  wwdc
//
//  Created by Chris Lowe on 6/19/12.
//  Copyright (c) 2012 Hashtag Studios. All rights reserved.
//

#import "TicketStatusTableViewController.h"

@interface TicketStatusTableViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *ticketStatusTableCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *ticketStatusNotesTableCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *ticketUserNameTableCell;
- (IBAction)signOutButtonSelected:(id)sender;

@end

@implementation TicketStatusTableViewController
@synthesize ticketStatusTableCell;
@synthesize ticketStatusNotesTableCell;
@synthesize ticketUserNameTableCell;
@synthesize ticketDetails;

- (void)viewWillAppear:(BOOL)animated {
    // Hide the back button (it doesnt make sense to go back!)
    self.navigationItem.hidesBackButton = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ticketUserNameTableCell.detailTextLabel.text = [self.ticketDetails objectForKey:@"user_name"];
    self.ticketStatusTableCell.detailTextLabel.text = [self.ticketDetails objectForKey:@"status"];
    
    NSString *statusText = [self.ticketDetails objectForKey:@"status_text"];
    self.ticketStatusNotesTableCell.detailTextLabel.text = statusText ? statusText : @"N/A";
}

- (void)viewDidUnload
{
    [self setTicketStatusTableCell:nil];
    [self setTicketStatusNotesTableCell:nil];
    [self setTicketUserNameTableCell:nil];
    [super viewDidUnload];
}

- (IBAction)signOutButtonSelected:(id)sender {
    NSLog(@"Logging Out...");
    //TODO - Call server to kill PHP session
    //TODO - Figure out what to do nativelt when logged off - Log In view?
    [self.navigationController popViewControllerAnimated:YES];
}
@end
