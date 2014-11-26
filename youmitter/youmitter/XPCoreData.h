
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface XPCoreData : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (XPCoreData *)sharedDataManager;

- (void)saveContext;

- (NSURL *)applicationDocumentsDirectory;

- (NSString *)baseURL;



@end
