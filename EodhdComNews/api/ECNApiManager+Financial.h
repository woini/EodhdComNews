// ECNApiManager+Financial.h
// Created by 01.02.2025.


#import <CoreData/CoreData.h>
#import "ECNNewsRequest.h"

@interface ECNApiManager (Financial)
- (void)getNews:(ECNNewsRequest *)request
        handler:(void(^)(NSArray<__kindof NSDictionary *> *response,
                         NSError *error))handler;
@end
