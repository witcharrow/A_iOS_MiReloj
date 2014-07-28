//
//  EditAlarmaTableViewController.m
//  MiReloj
//
//  Created by user11394 on 01/05/14.
//  Copyright (c) 2014 Alejandro Marijuán. All rights reserved.
//

#import "EditAlarmaTableViewController.h"
#import "Alarm.h"

@interface EditAlarmaTableViewController ()

@end

@implementation EditAlarmaTableViewController

@synthesize  nameField = _nameField;
@synthesize vibrationSwitch = _vibrationSwitch;
@synthesize alarm = _alarm;

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
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
    //## NECESARIO ocultar la tab bar para ganar espacio y mostrar todas las opciones
    [self.tabBarController.tabBar setHidden:YES];
    self.nameField.text = self.alarm.alarmName;
    [self.vibrationSwitch setOn:self.alarm.activated];
}
- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //## NECESARIO restaurar la tab bar tras editar las opciones
    [self.tabBarController.tabBar setHidden:NO];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - IBActions
- (IBAction)alarmDataChanged:(id)sender{
    self.alarm.alarmName = self.nameField.text;
    self.alarm.activated = self.vibrationSwitch.isOn;
}

@end
