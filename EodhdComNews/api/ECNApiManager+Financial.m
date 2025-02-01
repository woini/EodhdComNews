// ECNApiManager+Financial.m
// Created by 01.02.2025.


#import "ECNApiManagerClass.h"

@implementation ECNApiManager (Financial)
- (void)getNews:(ECNNewsRequest *)getInNew
        handler:(void(^)(NSArray<__kindof NSDictionary *> *response,
                         NSError *error))handler {
    [self get:@"news"
   parameters:getInNew
      success:^(NSArray<NSDictionary *> *arr) {

        if (handler) {
            handler(arr, nil);
        }
        
    } failure:^(NSError *error) {
        if (handler) {
            handler(nil, error);
        }
    }];
}
@end
