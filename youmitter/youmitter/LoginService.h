//
//  LoginService.h
//  youmitter
//
//  Created by HOME on 25/11/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginService : NSObject
- (void) loginWithUserName:(NSString *)userName andPassword:(NSString *)password withBlock:(void (^)(id loginResponse))block;
@end
