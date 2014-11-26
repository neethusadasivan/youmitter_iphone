//
//  ViewController.m
//  youmitter
//
//  Created by HOME on 25/11/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()
{
IBOutlet UITextField *userNameTextField;
IBOutlet UITextField *passwordTextField;
}

@property (nonatomic, strong)IBOutlet UIButton *loginButton;

-(IBAction)loginButtonClicked:(id)sender;

@end





@implementation ViewController
@synthesize loginButton;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Login";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)loginButtonClicked:(id)sender
{
    //    NSString *userName = userNameTextField.text;
    //    NSString *password = passwordTextField.text;
    //
    //    if (![userName isEqualToString:@""]) {
    //        NSLog(@"You have succesfully logged in.");
    //
    //        self.loginButton.titleLabel.textColor = [UIColor redColor];
    //    }
    
    LoginViewController *registrationViewController = [[LoginViewController alloc] init];
    
    [self.navigationController pushViewController:registrationViewController animated:YES];
    
    
}



@end
