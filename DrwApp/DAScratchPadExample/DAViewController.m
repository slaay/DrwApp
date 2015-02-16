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
#import "DWBubbleMenuButton.h"

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
    
    self.btnClearDrawing.layer.cornerRadius = self.btnClearDrawing.frame.size.width / 2;
    self.btnClearDrawing.clipsToBounds = YES;
    self.btnClearDrawing.layer.borderWidth = 1.0f;
    self.btnClearDrawing.layer.borderColor = [UIColor greenColor].CGColor;
    
    
    
    [self Extrabuttons];
    
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



//---------------------------Extra buttons------------------------------------
-(void)Extrabuttons{
    
    
    // Create up menu button
    UILabel *homeLabel = [self createHomeButtonView];
    
    DWBubbleMenuButton *upMenuView = [[DWBubbleMenuButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - homeLabel.frame.size.width - 20.f,
                                                                                          self.view.frame.size.height - homeLabel.frame.size.height - 20.f,
                                                                                          homeLabel.frame.size.width,
                                                                                          homeLabel.frame.size.height)
                                                            expansionDirection:DirectionUp];
    upMenuView.homeButtonView = homeLabel;
    
    [upMenuView addButtons:[self createDemoButtonArray]];
    
    [self.view addSubview:upMenuView];
    
    
}

- (UILabel *)createHomeButtonView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 40.f, 40.f)];
    
    label.text = @"C+";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.cornerRadius = label.frame.size.height / 2.f;
    label.backgroundColor =[UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
    label.clipsToBounds = YES;
    
    label.layer.cornerRadius = label.frame.size.width / 2;
    label.clipsToBounds = YES;
    label.layer.borderWidth = 1.0f;
    label.layer.borderColor = [UIColor greenColor].CGColor;
    
    
    
    return label;
}

- (NSArray *)createDemoButtonArray {
    NSMutableArray *buttonsMutable = [[NSMutableArray alloc] init];


    //facebook
    UIButton *btnFacebook = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnFacebook setTitle:@"" forState:UIControlStateNormal];
    btnFacebook.frame = CGRectMake(0.f, 0.f, 32.f, 32.f);
    btnFacebook.tag = 0;
    [btnFacebook addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    [buttonsMutable addObject:btnFacebook];
    btnFacebook.layer.cornerRadius = btnFacebook.frame.size.width / 2;
    btnFacebook.clipsToBounds = YES;
    btnFacebook.layer.borderWidth = 1.0f;
    btnFacebook.layer.borderColor = [UIColor greenColor].CGColor;
    btnFacebook.backgroundColor = [UIColor yellowColor];
    //Twitter
    UIButton *btnTwitter = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnTwitter setTitle:@"" forState:UIControlStateNormal];
    btnTwitter.frame = CGRectMake(0.f, 0.f, 32.f, 32.f);
    btnTwitter.tag = 1;

    [btnTwitter addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    [buttonsMutable addObject:btnTwitter];
    btnTwitter.layer.cornerRadius = btnTwitter.frame.size.width / 2;
    btnTwitter.clipsToBounds = YES;
    btnTwitter.layer.borderWidth = 1.0f;
    btnTwitter.layer.borderColor = [UIColor greenColor].CGColor;
    btnTwitter.backgroundColor = [UIColor whiteColor];



    return [buttonsMutable copy];
}


- (void)test:(UIButton *)sender {
    NSLog(@"Button tapped, tag: %ld", (long)sender.tag);
    
    UIButton* button = (UIButton*)sender;
	self.scratchPad.drawColor = button.backgroundColor;
    
    if ([sender tag] == 0){
        
          } //Facebook share
    else if ([sender tag] == 1) {
        
        }
    
    else {
        
        }
    
}

- (UIButton *)createButtonWithName:(NSString *)imageName {
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button sizeToFit];
    
    [button addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


@end
