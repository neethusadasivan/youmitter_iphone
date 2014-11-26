//
//  HTTPNetwork.m
//  youmitter
//
//  Created by HOME on 25/11/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//

#import "HTTPNetwork.h"
#import "XPCoreData.h"

@interface HTTPNetwork()
{
    BOOL isOperationCancelled;
}

@end
@implementation HTTPNetwork
@synthesize baseURL;
@synthesize taskArray;

- (id)init{
    if ([super init]) {
        self.baseURL = [NSURL URLWithString:[[XPCoreData sharedDataManager]baseURL]];
        self.taskArray = [[NSMutableArray alloc]init];
        isOperationCancelled = FALSE;
        //self.uploadURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/DefaultScopeSyncService.svc/DefaultScope/UploadChanges?userid=%@", self.baseURL, [anc valueForKey:@"userID"]]];
        //self.uploadURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/DefaultScopeSyncService.svc/DefaultScope/UploadChanges?", self.baseURL]];
        // self.downloadURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/DefaultScopeSyncService.svc/DefaultScope/DownloadChanges?", self.baseURL]];
    }
    return self;
}

-(void)callRemoteServiceWithParameters: (NSDictionary *)parameters andMethod:(XPMethodType)method
success:(void (^)(id responseObject))success
failure:(void (^)(NSError *eerror))failure{
    switch (method) {
        case XPMethodTypeSimplePost:
        {
            
            NSError *error;
            
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
            
            
            
            
            
            
            
            NSString *apiUrl = [NSString stringWithFormat:@"%@%@",[self.baseURL description],[parameters objectForKey:@"apiUrl"]];
            
            NSURL *url = [NSURL URLWithString:apiUrl];
            
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                                   cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                               timeoutInterval:60.0];
            
            [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
            
            [request setHTTPMethod:@"POST"];
            
            
            
            NSString *postString = [parameters objectForKey:@"postString"];
            [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
            
            
            NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSLog(@"Comes here");
            }];
            
            [postDataTask resume];
            
            
        }
            break;
   
            
        default:
            break;
    }
}

@end
