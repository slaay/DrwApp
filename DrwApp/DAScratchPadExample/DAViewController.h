//
//  DAViewController.h
//  DAScratchPadExample
//
//  Created by David Levi on 5/31/13.
//  Copyright (c) 2013 Double Apps Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DAViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) IBOutlet UIButton *btnBlack;
@property (strong, nonatomic) IBOutlet UIButton *btnRed;
@property (strong, nonatomic) IBOutlet UIButton *btnBlue;
@property (strong, nonatomic) IBOutlet UIButton *btnGreen;
@property (strong, nonatomic) IBOutlet UIButton *btnYellow;
@property (strong, nonatomic) IBOutlet UIButton *btnClearDrawing;
@property (strong, nonatomic) IBOutlet UISlider *sliderBrushSize;
@property (strong, nonatomic) IBOutlet UISlider *sliderTransparency;

@end
