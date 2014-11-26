
#import "XPCoreData.h"

@implementation XPCoreData

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

static XPCoreData *gSharedDataManager = nil;
static NSManagedObjectContext *objectContext = nil;


+ (XPCoreData *)sharedDataManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gSharedDataManager = [[XPCoreData alloc] init];
    });
    return gSharedDataManager;
}

- (NSString *)baseURL{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Info"ofType:@"plist"];
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    return [NSString stringWithString:[plistDict valueForKey:@"ServiceRoot"]];
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"youmitter" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    
    
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }

    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"youmitter"];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    NSDictionary *migrateOptions = [NSDictionary dictionaryWithObjectsAndKeys:
                                    
                                    [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                    
                                    [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];

    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:migrateOptions error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
       
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
         abort();
        //[[NSNotificationCenter defaultCenter]postNotificationName:MDSDBUPDATEFAILED object:nil];
    }
    
    return _persistentStoreCoordinator;
}


 -(void) resetPersistenStore {
     
     // NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"MediusFlowXl%@",OLD_APP_VERSION]];
     NSFileManager* fm = [[NSFileManager alloc] init];
     NSDirectoryEnumerator *dirEnumerator = [fm enumeratorAtURL:[self applicationDocumentsDirectory]
                                     includingPropertiesForKeys:@[ NSURLNameKey, NSURLIsDirectoryKey ]
                                                        options:NSDirectoryEnumerationSkipsHiddenFiles | NSDirectoryEnumerationSkipsSubdirectoryDescendants
                                                   errorHandler:nil];
     NSError* err = nil;
     BOOL res;
     
     NSString* file;
     while (file = [dirEnumerator nextObject]) {
         res = [fm removeItemAtURL:[self applicationDocumentsDirectory] error:&err];
         if (!res && err) {
             NSLog(@"oops: %@", err);
         }
     }
}



- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end
