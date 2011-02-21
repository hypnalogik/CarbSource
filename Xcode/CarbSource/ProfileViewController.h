//
//  ProfileViewController.h
//  CarbSource
//
//  Created by Karl Channell on 9/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ProfileViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	IBOutlet UITextField *txtName;
	IBOutlet UITextField *txtEmail;
	IBOutlet UISegmentedControl *conditionChooser;
	IBOutlet UIImageView *profilePic;
	NSString *conditionType;
	UIImagePickerController *ipc;
	
}

@property (nonatomic, retain) IBOutlet UITextField *txtName;
@property (nonatomic, retain) IBOutlet UITextField *txtEmail;
@property (nonatomic, retain) UISegmentedControl *conditionChooser;
@property (nonatomic, retain) NSString *conditionType;
@property (nonatomic, retain) UIImageView *profilePic;

- (IBAction) saveProfileInfo;
- (IBAction) makeKeyboardGoAway;
- (IBAction) conditionChanged;
- (IBAction) imageButtonClicked;

@end
