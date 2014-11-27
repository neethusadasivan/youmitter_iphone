//
//  LoginService.m
//  youmitter
//
//  Created by HOME on 25/11/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//

#import "LoginService.h"
#import "Constants.h"
#import "HTTPNetwork.h"
#import "LoginMapper.h"

@implementation LoginService
- (void) loginWithUserName:(NSString *)userName andPassword:(NSString *)password withBlock:(void (^)(id loginResponse))block
{
    //Create the request block for login.
    
    NSMutableDictionary *requestDict = [[NSMutableDictionary alloc]init];
    [requestDict setObject:[self theApiStringFor:userName andPassword:password] forKey:@"apiString"];
    
    //Prepare the dict for managing network.
    [requestDict setObject:SIGNIN_API_URL forKey:@"apiUrl"];
    [requestDict setObject:@"POST" forKey:@"httpMethod"];

    
    //Call the Network for logging in.
    
    HTTPNetwork *networkService = [[HTTPNetwork alloc]init];
    
    [networkService callRemoteServiceWithParameters:requestDict andMethod:XPMethodTypeSimplePost success:^(id responseObject) {
        NSDictionary *responseDict = responseObject;
        LoginMapper *mapper = [[LoginMapper alloc]init];
        [mapper insertUserInfo:responseDict];
        
        block([responseDict objectForKey:@"authentication"]);
        
    } failure:^(NSError *eerror) {
        
    }];
    
    
        //Save the response through the mapper.
    
        //Fetch the data from mapper and pass it to the login view.

    
}

-(NSString *)theApiStringFor:(NSString *)username andPassword:(NSString *)password
{
    return [NSString stringWithFormat:@"username=%@&password=%@", username, password];
}

//-(NSMutableDictionary *)theApiStringFor:(NSString *)username andPassword:(NSString *)password
//{
//    NSMutableDictionary *parameterDict  = [[NSMutableDictionary alloc]init];
//    
//    [parameterDict setObject:username forKey:@"username"];
//    [parameterDict setObject:password forKey:@"password"];
//    return parameterDict;
//}


@end
