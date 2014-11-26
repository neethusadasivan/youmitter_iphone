//
//  LoginViewController.h
//  youmitter
//
//  Created by HOME on 25/11/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController;


- (IBAction)buttonClicked:(id)Login {
    NSLog(@"Button pressed: %@", [sender currentTitle]);
}

@end

