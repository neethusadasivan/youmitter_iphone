//
//  HTTPNetwork.h
//  youmitter
//
//  Created by HOME on 25/11/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface HTTPNetwork : NSObject<NSURLSessionDelegate, NSURLSessionDataDelegate>
@property (nonatomic, strong)NSURL *baseURL;

@property (nonatomic, strong)NSMutableArray *taskArray;

-(void)callRemoteServiceWithParameters: (NSDictionary *)parameters andMethod:(XPMethodType)method
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *eerror))failure;


- (void)cancelAllOperations;
@end
