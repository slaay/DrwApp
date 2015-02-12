//
//  DAViewController.m
//  DAScratchPadExample
//
//  Created by David Levi on 5/31/13.
//  Copyright (c) 2013 Double Apps Inc. All rights reserved.
//

#import "DAViewController.h"
#import "DAScratchPadView.h"
#import <QuartzCore/QuartzCore.h>

@interface DAViewController ()
@property (unsafe_unretained, nonatomic) IBOutlet DAScratchPadView *scratchPad;
@property (unsafe_unretained, nonatomic) IBOutlet UISlider *airbrushFlowSlider;
- (IBAction)nextImage:(id)sender;
- (IBAction)setColor:(id)sender;
- (IBAction)setWidth:(id)sender;
- (IBAction)setOpacity:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)selectImage:(id)sender;
- (IBAction)paint:(id)sender;
- (IBAction)airbrush:(id)sender;
- (IBAction)airbrushFlow:(id)sender;
@end

@implementation DAViewController
{
	NSInteger curImage;
	UIImage* images[3];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	curImage = 0;
	images[0] = nil;
	images[1] = nil;
	images[2] = nil;
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
		self.airbrushFlowSlider.transform = CGAffineTransformTranslate(CGAffineTransformMakeRotation(-M_PI/2.0f), -30.0f, -35.0f);
	}
    
    
    
    
    
    
    self.btnBlack.layer.cornerRadius = self.btnBlack.frame.size.width / 2;
    self.btnBlack.clipsToBounds = YES;
    self.btnBlack.layer.borderWidth = 1.0f;
    self.btnBlack.layer.borderColor = [UIColor greenColor].CGColor;
    
    self.btnBlue.layer.cornerRadius = self.btnBlue.frame.size.width / 2;
    self.btnBlue.clipsToBounds = YES;
    self.btnBlue.layer.borderWidth = 1.0f;
    self.btnBlue.layer.borderColor = [UIColor greenColor].CGColor;
    
    
    self.btnGreen.layer.cornerRadius = self.btnGreen.frame.size.width / 2;
    self.btnGreen.clipsToBounds = YES;
    self.btnGreen.layer.borderWidth = 1.0f;
    self.btnGreen.layer.borderColor = [UIColor greenColor].CGColor;
    
    
    self.btnRed.layer.cornerRadius = self.btnRed.frame.size.width / 2;
    self.btnRed.clipsToBounds = YES;
    self.btnRed.layer.borderWidth = 1.0f;
    self.btnRed.layer.borderColor = [UIColor greenColor].CGColor;
    
    self.btnYellow.layer.cornerRadius = self.btnYellow.frame.size.width / 2;
    self.btnYellow.clipsToBounds = YES;
    self.btnYellow.layer.borderWidth = 1.0f;
    self.btnYellow.layer.borderColor = [UIColor greenColor].CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[self setScratchPad:nil];
	[self setAirbrushFlowSlider:nil];
	[super viewDidUnload];
}

- (IBAction)nextImage:(id)sender
{
	static NSArray* ETimages = nil;
	static NSInteger curETImage = 0;
	if (ETimages == nil) {
		ETimages = @[
					 @"ETup.jpg",
					 @"ETdown.jpg",
					 @"ETleft.jpg",
					 @"ETright.jpg",
					 @"ETupMirrored.jpg",
					 @"ETdownMirrored.jpg",
					 @"ETleftMirrored.jpg",
					 @"ETrightMirrored.jpg"
					 ];
	}
	[self.scratchPad setSketch:[UIImage imageNamed:ETimages[curETImage]]];
	curETImage++;
	if (curETImage >= ETimages.count) {
		curETImage = 0;
	}
}

- (IBAction)setColor:(id)sender
{
	UIButton* button = (UIButton*)sender;
	self.scratchPad.drawColor = button.backgroundColor;
}

- (IBAction)setWidth:(id)sender
{
	UISlider* slider = (UISlider*)sender;
	self.scratchPad.drawWidth = slider.value;
}

- (IBAction)setOpacity:(id)sender
{
	UISlider* slider = (UISlider*)sender;
	self.scratchPad.drawOpacity = slider.value;
}

- (IBAction)clear:(id)sender
{
	[self.scratchPad clearToColor:[UIColor clearColor]];
}

- (IBAction)selectImage:(id)sender
{
	images[curImage] = [self.scratchPad getSketch];
	UIButton* button = (UIButton*)sender;
	curImage = button.tag;
	[self.scratchPad setSketch:images[curImage]];
}

- (IBAction)paint:(id)sender
{
	self.scratchPad.toolType = DAScratchPadToolTypePaint;
}

- (IBAction)airbrush:(id)sender
{
	self.scratchPad.toolType = DAScratchPadToolTypeAirBrush;
}

- (IBAction)airbrushFlow:(id)sender
{
	UISlider* slider = (UISlider*)sender;
	self.scratchPad.airBrushFlow = slider.value;
}

@end
