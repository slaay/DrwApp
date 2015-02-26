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
    }];
    [menuView addMenuItemWithTitle:@"Twitter" andIcon:[UIImage imageNamed:@"Twitter.png"] andSelectedBlock:^{
        NSLog(@"Twitter selected");
    }];
    [menuView addMenuItemWithTitle:@"Instagram" andIcon:[UIImage imageNamed:@"instagram.png"] andSelectedBlock:^{
        NSLog(@"Instagram selected");
        
    }];
    [menuView addMenuItemWithTitle:@"" andIcon:[UIImage imageNamed:@""] andSelectedBlock:^{
        NSLog(@"blank selected");
        
    }];
    [menuView addMenuItemWithTitle:@"Website" andIcon:[UIImage imageNamed:@"post_type_bubble_link.png"] andSelectedBlock:^{
        NSLog(@"Website selected");
        
    }];
    [menuView addMenuItemWithTitle:@"" andIcon:[UIImage imageNamed:@""] andSelectedBlock:^{
        NSLog(@"blank selected");
        
    }];
    
    
    
    [menuView show];
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
