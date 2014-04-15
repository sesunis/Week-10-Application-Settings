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
        IBOutlet UITextField *title;
        IBOutlet UITextField *event;
        IBOutlet UIPickerView *where;
}

@property (nonatomic, retain) UITextField *Title;
@property (nonatomic, retain) UITextField *event;
@property (nonatomic, retain) UIPickerView *where;

-(IBAction) loadSettings: (id) sender;
-(IBAction) saveSettings: (id) sender;
-(IBAction) doneEditing: (id) sender;



@end
