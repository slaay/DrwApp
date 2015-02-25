//
//  DAViewController.m
//  DAScratchPadExample
//
//  Created by David Levi on 5/31/13.
//  Copyright (c) 2013 Double Apps Inc. All rights reserved.
//  share on Instagram
// http://stackoverflow.com/questions/11393071/how-to-share-an-image-on-instagram-in-ios

#import "DAViewController.h"
#import "DAScratchPadView.h"
#import <QuartzCore/QuartzCore.h>
#import "DWBubbleMenuButton.h"
#import "SWRevealViewController.h"
#import "DASharedGlobals.h"
#import "Twitter/Twitter.h"
#import "Social/Social.h"




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
- (IBAction)socialShare:(id)sender;
@end

@implementation DAViewController
{
	NSInteger curImage;
	UIImage* images[3];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 
    [self roundedControls:_btnBlack];
    [self roundedControls:_btnGreen];
    [self roundedControls:_btnRed];
    [self roundedControls:_btnYellow];
    [self roundedControls:_btnClearDrawing];
    [self roundedControls:_btnBlue];
    [self Extrabuttons];
    
    
    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
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
    [buttonsMutable addObject:[self addBubbleColorButtons:[UIColor yellowColor] btnID:0]];
    [buttonsMutable addObject:[self addBubbleColorButtons:[UIColor whiteColor] btnID:1]];
    [buttonsMutable addObject:[self addBubbleColorButtons:[UIColor magentaColor] btnID:2]];
    [buttonsMutable addObject:[self addBubbleColorButtons:[UIColor orangeColor] btnID:3]];
    return [buttonsMutable copy];
}


-(UIButton*)addBubbleColorButtons:(UIColor*)colorValue btnID:(NSInteger)idValue{

    UIButton* newBubbleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [newBubbleButton setTitle:@"" forState:UIControlStateNormal];
    newBubbleButton.frame = CGRectMake(0.f, 0.f, 32.f, 32.f);
    newBubbleButton.tag = idValue;
    
    [newBubbleButton addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    [newBubbleButton setBackgroundColor:colorValue];
    [self roundedControls:newBubbleButton];
    return newBubbleButton;
    
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

//Rounded buttons
-(void)roundedControls:(UIButton*)sender{
    UIButton* roundedButton = (UIButton*)sender;
    roundedButton.layer.cornerRadius = roundedButton.frame.size.width / 2;
    roundedButton.clipsToBounds = YES;
    roundedButton.layer.borderWidth = 1.0f;
    roundedButton.layer.borderColor = [UIColor greenColor].CGColor;
    
}

- (IBAction)socialShare:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Save to Camera Roll", @"Tweet it!", @"Facebook it!", @"Instagram it",  @"Cancel", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImage *canvasImage = self.scratchPad.getSketch;
    UIImageView *canvasImageView = [[UIImageView alloc] initWithImage:canvasImage];
    
    NSLog(@"Share button clicked %ld", (long)buttonIndex);
    
    if (buttonIndex == 3){
        //Share on Intagram
        NSLog(@"Share button clicked %ld = Instagram", (long)buttonIndex);
        
    } else
        if (buttonIndex == 2){
            //Share on facebook
            NSLog(@"Share button clicked %ld = Facebook", (long)buttonIndex);
            
            if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
            {
                SLComposeViewController *postSheet = [SLComposeViewController
                                                       composeViewControllerForServiceType:SLServiceTypeFacebook];
                if (postSheet){
                    [postSheet addImage:[UIImage imageNamed:@"drwApp.png"]];
                    [postSheet addURL:[NSURL URLWithString:LINK_SLaaySourcecoders]];
                    [postSheet setInitialText:SHARE_text];
                    
                    [postSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
                        if (result == SLComposeViewControllerResultDone) {
                            NSLog(@"Posted");
                        } else if (result == SLComposeViewControllerResultCancelled) {
                            NSLog(@"Post Cancelled");
                        } else {
                            NSLog(@"Post Failed");
                        }
                    }];
                    
                    [self presentViewController:postSheet animated:YES completion:nil];
                    
                }
                
                
            } else {
                if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
                { SLComposeViewController *postSheet = [SLComposeViewController
                                                         composeViewControllerForServiceType:SLServiceTypeFacebook];
                    [postSheet setInitialText:SHARE_text];
                    [self presentViewController:postSheet animated:YES completion:nil];
                    //inform the user that no account is configured with alarm view.
                }
                
            }
            
        } else
            if (buttonIndex == 1)
            {
                //Share on Twitter.
                NSLog(@"Share button clicked %ld = Twitter", (long)buttonIndex);
                if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
                {
                    SLComposeViewController *tweetSheet = [SLComposeViewController
                                                           composeViewControllerForServiceType:SLServiceTypeTwitter];
                    if (tweetSheet){
                        [tweetSheet addImage:[UIImage imageNamed:@"drwApp.png"]];
                        [tweetSheet addURL:[NSURL URLWithString:LINK_SLaaySourcecoders]];
                        [tweetSheet setInitialText:SHARE_text];
                        
                        [tweetSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
                            if (result == SLComposeViewControllerResultDone) {
                                NSLog(@"Posted");
                            } else if (result == SLComposeViewControllerResultCancelled) {
                                NSLog(@"Post Cancelled");
                            } else {
                                NSLog(@"Post Failed");
                            }
                        }];
                        
                        [self presentViewController:tweetSheet animated:YES completion:nil];
                        
                    }
                    
                    
                } else {
                    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
                    { SLComposeViewController *tweetSheet = [SLComposeViewController
                                                             composeViewControllerForServiceType:SLServiceTypeTwitter];
                        [tweetSheet setInitialText:SHARE_text];
                        [self presentViewController:tweetSheet animated:YES completion:nil];
                        //inform the user that no account is configured with alarm view.
                    }
                    
                }
                
            } else if(buttonIndex == 0) {
                //Save to camera roll
                NSLog(@"Share button clicked %ld = Camera roll", (long)buttonIndex);
                UIGraphicsBeginImageContextWithOptions(canvasImageView.bounds.size, NO, 0.0);
                [canvasImageView.image drawInRect:CGRectMake(0, 0, canvasImageView.frame.size.width, canvasImageView.frame.size.height)];
                UIImage *SaveImage = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                UIImageWriteToSavedPhotosAlbum(SaveImage, self,@selector(image:didFinishSavingWithError:contextInfo:), nil);
            }


}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    // Was there an error?
    if (error != NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Image could not be saved.Please try again"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Close", nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Image was successfully saved in photoalbum"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Close", nil];
        [alert show];
    }
}


@end
