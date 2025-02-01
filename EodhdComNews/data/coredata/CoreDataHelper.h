// CoreDataHelper.h
// Created by 01.02.2025.
        

#import <CoreData/CoreData.h>

@interface CoreDataHelper : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectContext *backgroundManagedObjectContext;

- (void)saveContext:(void(^)(bool finish))handler;
- (void)arrayFromEntity:(NSString *)entityName
                  block:(void(^)(NSArray<__kindof NSManagedObject *> *array))handler;
@end
