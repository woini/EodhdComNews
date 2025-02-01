// NSManagedObject+Operation.m
// Created by 01.02.2025.
        

#import "NSManagedObject+Operation.h"

@implementation NSManagedObject (Operation)
+ (__kindof NSManagedObject *)createMObject; {
    NSManagedObjectContext *context =
        ECNApp.sharedApp.coreDataHelper.managedObjectContext;
    __block NSManagedObject *item =
        [NSEntityDescription insertNewObjectForEntityForName:self.className
                                      inManagedObjectContext:context];
    return item;
}


+ (NSString *)className {
    return NSStringFromClass(self.class);
}


- (void)deleteMObject {
    NSManagedObjectContext *context = ECNApp.sharedApp.coreDataHelper.managedObjectContext;
    [context deleteObject:self];
    [ECNApp.sharedApp.coreDataHelper saveContext:nil];
}


+ (void)arrayEntities:(void(^)(NSArray *array))block {
    [ECNApp.sharedApp.coreDataHelper arrayFromEntity:self.className
                                               block:block];
}
@end
