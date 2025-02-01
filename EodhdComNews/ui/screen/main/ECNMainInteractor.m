//  ECNMainInteractor.m
//  Created on 01.02.2025.


#import "ECNMainInteractor.h"
#import "ECNMainBoundaryModels.h"
#import "NSDate+Utilities.h"
#import "ECNNewResponse.h"
#import "NSDateFormatter+Utilities.h"
#import "NSDictionary+Mapping.h"

@interface ECNMainInteractor ()
@end


@implementation ECNMainInteractor
#pragma mark - Business logic
- (void)doStartWithBeginInteractor {
    
    /// [self debugDeleteMObjects];
    
    [self loadWithDisplayNews];
    [self loadCurrentNews];
}
     
     
- (void)loadCurrentNews {
    [self loadDisplayNewsByDate:NSDate.date];
}


- (void)loadDisplayNewsByDate:(NSDate *)date {
    [self loadNewsByDate:date
                 handler:^(NSArray<NSDictionary *> *list,
                           NSError *error) {
        [self updateCoreDataContent:list
                            handler:^(bool finish) {
            [self loadWithDisplayNews];
        }];
    }];
}


- (void)loadWithDisplayNews {
    [self loadCoreDateContent:^(NSArray<ECNNewResponse *> *array) {
        ECNMainPresenterModel *presenterModel =
        [ECNMainPresenterModel initWithList:array];
        [self.output presentChangeWithPresenterModel:presenterModel];
    }];
}


- (void)debugDeleteMObjects {
#ifdef DEBUG
    [ECNNewResponse arrayEntities:^(NSArray *array) {
        for (ECNNewResponse *newResponse in array) {
            [newResponse deleteMObject];
        }
    }];
#endif
}


- (void)updateCoreDataContent:(NSArray<NSDictionary *> *)list
                      handler:(void(^)(bool finish))handler {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        for (NSDictionary *dictionary in list) {
            if ([dictionary isKindOfClass:NSDictionary.class]) {
                [dictionary mappingEodhdNews];
            }
        }
        [ECNApp.sharedApp.coreDataHelper saveContext:handler];
    });
}


- (void)loadCoreDateContent:(void(^)(NSArray<ECNNewResponse *> *array))handler {
    [ECNNewResponse arrayEntities:^(NSArray *array) {
        if (handler) {
            handler(array);
        }
    }];
}


- (void)loadNewsByDate:(NSDate *)date
               handler:(void(^)(NSArray<__kindof NSDictionary *> *response,
                                NSError *error))handler {
    NSDate *dateAtStartOfDay = date.dateAtStartOfDay;
    NSDate *dateAtEndOfDay = date.dateAtEndOfDay;
    
    ECNNewsRequest *newsRequest =
        [ECNNewsRequest initWithS:nil
                                t:nil
                         apiToken:ECNApiManager.token
                             from:dateAtStartOfDay
                               to:dateAtEndOfDay
                            limit:@(1000)
                           offset:nil
        ];
    [ECNApp.sharedApp.apiManager getNews:newsRequest
                                 handler:handler];
}


- (void)doChangeWithInteractorModel:(ECNMainInteractorModel *)interactorModel {
    NSDate *selectedDate = interactorModel.date.withoutGMT;
    NSDate *previousDate = selectedDate.dateYesterday;
    [self loadDisplayNewsByDate:previousDate];
}
@end
