//
//  LoginViewController.m
//  youmitter
//
//  Created by HOME on 25/11/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//


#import "LoginViewController.h"
#import "LoginService.h"
#import "HomeViewController.h"
#import "ConstellationViewController.h"
#import "YouViewController.h"


@interface LoginViewController ()
{
    IBOutlet UITextField *userNameTextField;
    IBOutlet UITextField *passwordTextField;
}
@property (nonatomic,strong)HomeViewController *homeViewController;
@property (nonatomic,strong)ConstellationViewController *constellationViewController;
@property (nonatomic,strong)YouViewController *youViewController;

-(IBAction)loginButtonClicked:(id)sender;
@end

@implementation LoginViewController
@synthesize homeViewController, constellationViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarController.tabBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)loginButtonClicked:(id)sender
{
    LoginService *service  = [[LoginService alloc]init];
    [service loginWithUserName:userNameTextField.text andPassword:passwordTextField.text withBlock:^(id loginResponse) {
        NSString *responseAuth = loginResponse;
        
        if ([responseAuth isEqualToString:@"Sucess"]) {
            
            self.tabBarController.tabBar.hidden = NO;
            
            
            self.homeViewController =[[HomeViewController alloc]init];
            self.constellationViewController = [[ConstellationViewController alloc]init];
            self.youViewController = [[YouViewController alloc]init];
            
            
            UINavigationController *universeNavigationController = [[UINavigationController alloc]initWithRootViewController:self.homeViewController];
            universeNavigationController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Universe" image:nil tag:0];

            UINavigationController *constellationNavigationController = [[UINavigationController alloc]initWithRootViewController:self.constellationViewController];
            constellationNavigationController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Constellation" image:nil tag:2];
            
            UINavigationController *youNavigationViewController = [[UINavigationController alloc]initWithRootViewController:self.youViewController];
            youNavigationViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"You" image:nil tag:1];
            
            
            self.tabBarController.viewControllers = [[NSArray alloc]initWithObjects:universeNavigationController,youNavigationViewController,constellationNavigationController,nil];
            
            
            
        }
        
    }];
    
}

@end
