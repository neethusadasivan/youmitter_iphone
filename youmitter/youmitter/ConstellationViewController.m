//
//  ConstellationViewController.m
//  youmitter
//
//  Created by Sreekanth on 11/28/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//

#import "ConstellationViewController.h"

@interface ConstellationViewController ()

@end

@implementation ConstellationViewController

-(id)init
{
    self = [super init];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Constellation" image:nil tag:0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

@end
