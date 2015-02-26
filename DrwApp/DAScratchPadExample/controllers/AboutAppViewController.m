//
//  AboutAppViewController.m
//  DrwApp
//
//  Created by Presley on 26/02/15.
//  Copyright (c) 2015 Double Apps Inc. All rights reserved.
//

#import "AboutAppViewController.h"
#import "CHTumblrMenuView.h"
#import "SWRevealViewController.h"
#import "DASharedGlobals.h"
#import "Twitter/Twitter.h"
#import "Social/Social.h"

@interface AboutAppViewController ()

@end

@implementation AboutAppViewController

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
    
     self.title = @"About App";
    [self AddTumblerStyleMenuControls:_btnImg];
    [self roundedControls:_btnImg];
    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)AddTumblerStyleMenuControls:(id)sender{
     UIButton* btnImg = (UIButton*)sender;
    [btnImg addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];

}

//Rounded buttons
-(void)roundedControls:(UIButton*)sender{
    UIButton* roundedButton = (UIButton*)sender;
    roundedButton.layer.cornerRadius = roundedButton.frame.size.width / 2;
    roundedButton.clipsToBounds = YES;
    roundedButton.layer.borderWidth = 1.0f;
    roundedButton.layer.borderColor = [UIColor greenColor].CGColor;
    
}

- (void)showMenu
{
    CHTumblrMenuView *menuView = [[CHTumblrMenuView alloc] init];
    [menuView addMenuItemWithTitle:@"Facebook" andIcon:[UIImage imageNamed:@"Facebook.png"] andSelectedBlock:^{
        NSLog(@"Facebook selected");
        [self shareOnSocial:1];
    }];
    [menuView addMenuItemWithTitle:@"Twitter" andIcon:[UIImage imageNamed:@"Twitter.png"] andSelectedBlock:^{
        NSLog(@"Twitter selected");
        [self shareOnSocial:2];
    }];
    [menuView addMenuItemWithTitle:@"Instagram" andIcon:[UIImage imageNamed:@"instagram.png"] andSelectedBlock:^{
        NSLog(@"Instagram selected");
        [self shareOnSocial:3];
        
    }];
    [menuView addMenuItemWithTitle:@"Website" andIcon:[UIImage imageNamed:@"post_type_bubble_link.png"] andSelectedBlock:^{
        NSLog(@"Website selected");
        [self shareOnSocial:4];
        
    }];
    [menuView addMenuItemWithTitle:@"" andIcon:[UIImage imageNamed:@""] andSelectedBlock:^{
        NSLog(@"blank selected");

        
    }];
    [menuView addMenuItemWithTitle:@"" andIcon:[UIImage imageNamed:@"Github.png"] andSelectedBlock:^{
        NSLog(@"github selected");
        [self shareOnSocial:5];
        
    }];
    
    
    
    [menuView show];
}


-(void)shareOnSocial:(NSInteger)indexValue{
    if (indexValue == 1){
        NSLog(@"Facebook selected");
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
    }//of facebook
    else
        if (indexValue == 2){
            //Share on Twitter.
            NSLog(@"Share button clicked %ld = Twitter", (long)indexValue);
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

            
        } //of twitter
    else
        if (indexValue == 4){
          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:LINK_SLaaySourcecoders]];
            
        }//of website
    else
            if (indexValue == 5){
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:LINK_Github_Profile]];
                
            }//of github

    
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

@end
