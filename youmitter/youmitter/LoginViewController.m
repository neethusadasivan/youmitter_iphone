//
//  LoginViewController.m
//  youmitter
//
//  Created by HOME on 25/11/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//


#import "LoginViewController.h"
#import "LoginService.h"

@interface LoginViewController ()
{
    IBOutlet UITextField *userNameTextField;
    IBOutlet UITextField *passwordTextField;
}
-(IBAction)loginButtonClicked:(id)sender;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        
    }];
    
}

@end
