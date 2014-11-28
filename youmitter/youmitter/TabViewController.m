    //
//  TabViewController.m
//  youmitter
//
//  Created by Sreekanth on 11/28/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//

#import "TabViewController.h"
#import "HomeViewController.h"
#import "ConstellationViewController.h"

@interface TabViewController ()
@property (nonatomic,strong)NSMutableArray *vcArray;
@end

@implementation TabViewController
@synthesize vcArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    ConstellationViewController *constellationViewController = [[ConstellationViewController alloc]init];
    HomeViewController *homeViewController = [[HomeViewController alloc]init];
    [self.vcArray addObject:constellationViewController];
    [self.vcArray addObject:homeViewController];
    
    
    self.viewControllers = self.vcArray;
    
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
