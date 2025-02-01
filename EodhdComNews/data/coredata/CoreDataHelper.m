// CoreDataHelper.m
// Created by 01.02.2025.
        

#import "CoreDataHelper.h"
 
@implementation CoreDataHelper

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize backgroundManagedObjectContext = _backgroundManagedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

static NSString * const kEodhdComNews = @"EodhdComNews";

- (instancetype)init {
    self = [super init];
    if (self) {
        [self settingsCoreData];
    }
    return self;
}


- (void)settingsCoreData {
    [self createManagedObjectModel];
    [self createPersistentStoreCoordinator];
    [self createManagedObjectContext];
    [self craeteBackgroundManagedObjectContext];
    
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(mocDidSaveNotification:)
                                               name:NSManagedObjectContextDidSaveNotification
                                             object:nil];
}


- (NSManagedObjectModel *)createManagedObjectModel {
    NSURL *modelURL = [NSBundle.mainBundle URLForResource:kEodhdComNews withExtension:@"momd"];
    return _managedObjectModel = [NSManagedObjectModel.alloc initWithContentsOfURL:modelURL];
}


- (NSPersistentStoreCoordinator *)createPersistentStoreCoordinator {
    NSString *sqLiteFile = [NSString stringWithFormat:@"%@.sqlite", kEodhdComNews];
    NSURL *storeURL = [self.applicationCachesDirectory URLByAppendingPathComponent:sqLiteFile];
    _persistentStoreCoordinator =
        [NSPersistentStoreCoordinator.alloc initWithManagedObjectModel:_managedObjectModel];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:storeURL
                                                         options:@{NSMigratePersistentStoresAutomaticallyOption : @YES,
                                                                   NSInferMappingModelAutomaticallyOption : @YES}
                                                           error:nil]) {

        [NSFileManager.defaultManager removeItemAtURL:storeURL error:nil];
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:@{NSMigratePersistentStoresAutomaticallyOption : @YES}
                                                          error:nil];
    }
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)createManagedObjectContext {
    _managedObjectContext =
        [NSManagedObjectContext.alloc initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:_persistentStoreCoordinator];
    [_managedObjectContext setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    return _managedObjectContext;
}


- (NSManagedObjectContext *)craeteBackgroundManagedObjectContext {
    _backgroundManagedObjectContext =
        [NSManagedObjectContext.alloc initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [_backgroundManagedObjectContext setParentContext:_managedObjectContext];
    [_backgroundManagedObjectContext setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    return _backgroundManagedObjectContext;
}


- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}


- (NSURL *)applicationCachesDirectory {
    return [NSFileManager.defaultManager URLsForDirectory:NSCachesDirectory
                                                inDomains:NSUserDomainMask].lastObject;
}


- (void)mocDidSaveNotification:(NSNotification *)notification {
    NSManagedObjectContext *savedContext = notification.object;
    
    if (_managedObjectContext == savedContext) {
        return;
    }
    
    if (_managedObjectContext.persistentStoreCoordinator != savedContext.persistentStoreCoordinator) {
        return;
    }
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        [_managedObjectContext mergeChangesFromContextDidSaveNotification:notification];
    });
}


- (void)saveContext:(void(^)(bool finish))handler {
    [self.backgroundManagedObjectContext performBlock:^{
        [self.backgroundManagedObjectContext save:nil];
        [self.managedObjectContext performBlock:^{
            bool result = [self.managedObjectContext save:nil];
            
            if (handler) {
                handler(result);
            }
        }];
    }];
}


- (void)arrayFromEntity:(NSString *)entityName
                  block:(void(^)(NSArray<__kindof NSManagedObject *> *array))handler {
    NSFetchRequest *request = NSFetchRequest.alloc.init;
    NSManagedObjectContext *context = _managedObjectContext;
    NSEntityDescription *entity =
        [NSEntityDescription entityForName:entityName
                    inManagedObjectContext:context];
    [request setEntity:entity];

    [context performBlock:^{
        NSError *error = nil;
        NSArray *result = [context executeFetchRequest:request
                                                 error:&error];
        if (handler) {
            
            if (result && !error) {
                handler(result);
            } else {
                handler(@[]);
            }
        }
    }];
}
@end
