//
//  ApplicationSettingsViewController.h
//  ApplicationSettings
//    Change
//  Created by Sarah Esunis on 4/12/14.
//  Copyright 2014 Sarah Esunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicationSettingsViewController : UIViewController 
<UIPickerViewDataSource, UIPickerViewDelegate> 
{
        IBOutlet UITextField *loginName;
        IBOutlet UITextField *password;
        IBOutlet UIPickerView *favoriteColor;
}

@property (nonatomic, retain) UITextField *loginName;
@property (nonatomic, retain) UITextField *password;
@property (nonatomic, retain) UIPickerView *favoriteColor;

-(IBAction) loadSettings: (id) sender;
-(IBAction) saveSettings: (id) sender;
-(IBAction) doneEditing: (id) sender;



@end
