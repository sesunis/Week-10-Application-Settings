//
//  ApplicationSettingsViewController.m
//  ApplicationSettings
//
//  Created by Sarah Esunis on 4/12/14.
//  Copyright 2014 Sarah Esunis. All rights reserved.
//

#import "ApplicationSettingsViewController.h"

@implementation ApplicationSettingsViewController

@synthesize Title;
@synthesize event;
@synthesize where;

NSMutableArray *places;
NSString *placesSelected;

-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}

- (void)viewDidLoad {
    //---create an array containing the colors values---
    places = [[NSMutableArray alloc] init];
    [places addObject:@"Home"];
    [places addObject:@"Work"];
    [places addObject:@"Other"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    [super viewDidLoad];
   
        // Do any additional setup after loading the view, typically from a nib.

        
        [self.view addGestureRecognizer:tap];
    

    }
    -(void)dismissKeyboard {
        // add textfields and textviews
        //[Nameofoutletlikeatextfield resignFirstResponder];
        [self.Title resignFirstResponder];
        [self.event resignFirstResponder];
        [self.where resignFirstResponder];
     
    }


//---number of components in the Picker view---
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

//---number of items(rows) in the Picker view---
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return [places count];
}

//---populating the Picker view---
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [places objectAtIndex:row];
}

//---the item selected by the user---
- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    placesSelected = [places objectAtIndex:row];
}

-(IBAction) loadSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    title.text = [defaults objectForKey:@"title"];
    event.text = [defaults objectForKey:@"title"];
    
    //---find the index of the array for the color saved---
    placesSelected = [[NSString alloc] initWithString:
                             [defaults objectForKey:@"where"]];
    int selIndex = [places indexOfObject:placesSelected];
    
    //---display the saved color in the Picker view---
    [where selectRow:selIndex inComponent:0 animated:YES];
}

-(IBAction) saveSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:title.text forKey:@"title"];
    [defaults setObject:event.text forKey:@"events"];
    [defaults setObject:placesSelected forKey:@"where"];
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
    [places release];
    [placesSelected release];
    [title release];
    [event release];
    [where  release];
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
