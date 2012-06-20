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
- (IBAction)signOutButtonSelected:(id)sender;

@end

@implementation TicketStatusTableViewController
@synthesize ticketStatusTableCell;

- (void)viewWillAppear:(BOOL)animated {
    // Hide the back button (it doesnt make sense to go back!)
    self.navigationItem.hidesBackButton = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ticketStatusTableCell.detailTextLabel.text = @"#winning!";
}

- (void)viewDidUnload
{
    [self setTicketStatusTableCell:nil];
    [super viewDidUnload];
}

- (IBAction)signOutButtonSelected:(id)sender {
    NSLog(@"Logging Out...");
    //TODO - Call server to kill PHP session
    //TODO - Figure out what to do nativelt when logged off - Log In view?
}
@end
