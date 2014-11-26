//
//  UserInfo.h
//  youmitter
//
//  Created by Sreekanth on 11/25/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserInfo : NSManagedObject

@property (nonatomic, retain) NSString * api_key;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * image_url;
@property (nonatomic, retain) NSString * authentication;

@end
