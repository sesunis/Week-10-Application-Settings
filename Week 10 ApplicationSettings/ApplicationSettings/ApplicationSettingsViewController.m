//
//  ApplicationSettingsViewController.m
//  ApplicationSettings
//
//  Created by Wei-Meng Lee on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ApplicationSettingsViewController.h"

@implementation ApplicationSettingsViewController

@synthesize loginName;
@synthesize password;
@synthesize favoriteColor;

NSMutableArray *colors;
NSString *favoriteColorSelected;

-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}

- (void)viewDidLoad {
    //---create an array containing the colors values---
    colors = [[NSMutableArray alloc] init];
    [colors addObject:@"Red"];
    [colors addObject:@"Green"];
    [colors addObject:@"Blue"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    [super viewDidLoad];
}

//---number of components in the Picker view---
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

//---number of items(rows) in the Picker view---
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return [colors count];
}

//---populating the Picker view---
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [colors objectAtIndex:row];
}

//---the item selected by the user---
- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    favoriteColorSelected = [colors objectAtIndex:row];
}

-(IBAction) loadSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    loginName.text = [defaults objectForKey:@"login_name"];
    password.text = [defaults objectForKey:@"password"];
    
    //---find the index of the array for the color saved---
    favoriteColorSelected = [[NSString alloc] initWithString:
                             [defaults objectForKey:@"color"]];
    int selIndex = [colors indexOfObject:favoriteColorSelected];
    
    //---display the saved color in the Picker view---
    [favoriteColor selectRow:selIndex inComponent:0 animated:YES];
}

-(IBAction) saveSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:loginName.text forKey:@"login_name"];
    [defaults setObject:password.text forKey:@"password"];
    [defaults setObject:favoriteColorSelected forKey:@"color"];
    [defaults synchronize];
    
    UIAlertView *alert = 
    [[UIAlertView alloc] initWithTitle:@"Settings Value Saved"
                               message:@"Settings Saved"
                              delegate:nil
                     cancelButtonTitle:@"Done"
                     otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)dealloc {
    [colors release];
    [favoriteColorSelected release];
    [loginName release];
    [password release];
    [favoriteColor release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
