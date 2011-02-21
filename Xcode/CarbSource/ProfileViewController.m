//
//  ProfileViewController.m
//  CarbSource
//
//  Created by Karl Channell on 9/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ProfileViewController.h"


@implementation ProfileViewController

@synthesize txtName, txtEmail, conditionType, conditionChooser, profilePic;


// This takes the profile data from the text fields, segment option and image and save it to a plist file
- (IBAction) saveProfileInfo
{
	[txtName resignFirstResponder];
	[txtEmail resignFirstResponder];
	NSString *name = [[NSString alloc] initWithFormat:@"%@",txtName.text];
	NSString *email = [[NSString alloc] initWithFormat:@"%@",txtEmail.text];

	//NSLog(@"Save profile info to a plist file");
	NSLog(@"Save this info to plist. Name - %@ , Email - %@ , Type - %@", txtName.text, txtEmail.text, conditionType);
	[name release];
	[email release];
}

- (IBAction) makeKeyboardGoAway
{
	[txtName resignFirstResponder];
	[txtEmail resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (IBAction) conditionChanged
{
	switch (conditionChooser.selectedSegmentIndex) {
		case 0:
			//NSLog(@"selected %d", conditionChooser.selectedSegmentIndex);
			conditionType = @"Type 1";
			break;
		case 1:
			//NSLog(@"selected %d", conditionChooser.selectedSegmentIndex);
			conditionType = @"Type 2";
			break;
		default:
			//NSLog(@"selected %d", conditionChooser.selectedSegmentIndex);
			conditionType = @"Diet";
			break;
	}
}

- (IBAction) imageButtonClicked
{
	ipc = [[UIImagePickerController alloc] init];
	ipc.delegate = self;
	ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	
	[self presentModalViewController:ipc animated:YES];
	[ipc release];
}

//  two UIImagePickerDelegate Methods - finished, and cancelled

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	// release picker
	[[picker parentViewController] dismissModalViewControllerAnimated:YES];
    [picker release];
}


- (void)imagePickerController:(UIImagePickerController *)picker 
didFinishPickingMediaWithInfo:(NSDictionary *)info {
	// set image
	profilePic.image = [info objectForKey:UIImagePickerControllerOriginalImage];
	UIImage *newPic = [info objectForKey:UIImagePickerControllerOriginalImage];
	// release picker
	NSLog(@"%@", newPic);
    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
    [picker release];
	
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
