// ECNApiManager.h
// Created by 01.02.2025.

#import "ECNNewsRequest.h"

@interface ECNApiManager : NSObject
@property (atomic, strong, readonly) NSURLSession *urlSession;

- (void)get:(NSString *)suffix
 parameters:(ECNNewsRequest *)parameters
    success:(void (^)(__kindof NSObject *obj))success
    failure:(void (^)(NSError *error))failure;
@end
