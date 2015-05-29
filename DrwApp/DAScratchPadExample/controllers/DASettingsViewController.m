//
//  DASettingsViewController.m
//  DrwApp
//
//  Created by Presley on 27/05/15.
//  Copyright (c) 2015 Double Apps Inc. All rights reserved.
//

#import "DASettingsViewController.h"
#import "SWRevealViewController.h"

@interface DASettingsViewController ()

@end

@implementation DASettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    //self.tableViewSettings.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)brushSize:(id)sender {
	UISlider* slider = (UISlider*)sender;
	// = slider.value;
}

- (IBAction)brushTransparancy:(id)sender {
	UISlider* slider = (UISlider*)sender;
	// = slider.value;
}
@end
