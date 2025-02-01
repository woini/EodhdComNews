// NSManagedObject+Operation.h
// Created by 01.02.2025.


#import <CoreData/CoreData.h>

@interface NSManagedObject (Operation)
+ (__kindof NSManagedObject *)createMObject;
+ (void)arrayEntities:(void(^)(NSArray *array))block;
- (void)deleteMObject;
@end
