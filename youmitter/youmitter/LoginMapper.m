//
//  LoginMapper.m
//  youmitter
//
//  Created by HOME on 25/11/14.
//  Copyright (c) 2014 Ruby Software. All rights reserved.
//

#import "LoginMapper.h"
#import "UserInfo.h"
#import "XPCoreData.h"

@implementation LoginMapper
-(void)insertUserInfo:(NSMutableDictionary *)dictCategory
{
    NSManagedObjectContext* context = [[XPCoreData sharedDataManager]managedObjectContext];
    
    NSMutableDictionary *userDic = [dictCategory objectForKey:@""];
    if(userDic == nil || [userDic isKindOfClass:[NSNull class]])return;
    UserInfo *userInfo = [self fetchUserInfoWithApiKey:[userDic objectForKey:@"api_key"]];
    if(userInfo == nil)
    {
        userInfo = [NSEntityDescription insertNewObjectForEntityForName:@"UserInfo" inManagedObjectContext:context];
    }
    [userInfo setValue:[dictCategory objectForKey:@"api_key"] forKey:@"api_key"];
    [userInfo setValue:[dictCategory objectForKey:@"name"] forKey:@"name"];
    [userInfo setValue:[dictCategory objectForKey:@"username"] forKey:@"username"];
    [userInfo setValue:[dictCategory objectForKey:@"image_url"] forKey:@"image_url"];
    [userInfo setValue:[dictCategory objectForKey:@"authentication"] forKey:@"authentication"];
    
    NSError *Exception;
    if (![context save:&Exception]) {
        NSLog(@"oops, couldn't save: %@", [Exception localizedDescription]);
    }
}

- (UserInfo *)fetchUserInfoWithApiKey:(NSNumber *)apiKey
{
    NSManagedObjectContext* context = [[XPCoreData sharedDataManager]managedObjectContext];
    NSError *error = nil;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"api_key == %@", [apiKey stringValue]];
    [fetchRequest setPredicate:predicate];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"UserInfo" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    UserInfo *usernfo = (fetchedObjects.count > 0)?[fetchedObjects lastObject]:nil;
    return usernfo;
}

- (NSArray *)fetchUserInfo{
    NSManagedObjectContext* context = [[XPCoreData sharedDataManager]managedObjectContext];
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"UserInfo" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}
@end

