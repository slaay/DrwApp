//
//  DASettingsViewController.h
//  DrwApp
//
//  Created by Presley on 27/05/15.
//  Copyright (c) 2015 Double Apps Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DASettingsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableViewSettings;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) IBOutlet UISlider *sliderBrushSize;
@property (strong, nonatomic) IBOutlet UISlider *sliderBrushTransparency;
- (IBAction)brushSize:(id)sender;
- (IBAction)brushTransparancy:(id)sender;
@end
