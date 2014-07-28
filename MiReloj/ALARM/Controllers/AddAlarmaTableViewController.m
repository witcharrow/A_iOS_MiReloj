//
//  AddAlarmaTableViewController.m
//  MiReloj
//
//  Created by user11394 on 29/04/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "AddAlarmaTableViewController.h"
#import "Alarm.h"
#import "ListaAlarmasViewController.h"

@interface AddAlarmaTableViewController ()

@end

@implementation AddAlarmaTableViewController

@synthesize listaAlarmasLVC = _listViewController;
@synthesize descriptionAlarmTextView = _descriptionAlarmTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)didReceiveMemoryWarning{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad{
    [super viewDidLoad];
}
- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark - IBActions
- (void)addButtonPressed:(id)sender {
    // Create the alarm
    Alarm *nuevaAlarma = [[Alarm alloc] init];
    nuevaAlarma.alarmName = self.descriptionAlarmTextView.text;
    nuevaAlarma.activated = NO;
    
    // Add it to the list
    [self.listaAlarmasLVC.alarms addObject:nuevaAlarma];
    [self.listaAlarmasLVC refreshList];
    
    // Dismiss the view controller
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)cancelButtonPressed:(id)sender {
   [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
