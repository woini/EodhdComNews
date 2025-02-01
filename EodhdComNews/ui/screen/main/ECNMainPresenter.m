//  ECNMainPresenter.m
//  Created on 01.02.2025.


#import "ECNMainPresenter.h"
#import "ECNMainBoundaryModels.h"
#import "NSDate+Utilities.h"
#import "NSDateFormatter+Utilities.h"

@interface ECNMainPresenter ()
@end


@implementation ECNMainPresenter
#pragma mark - Presentation logic
- (void)presentChangeWithPresenterModel:(ECNMainPresenterModel *)presenterModel {
    NSMutableDictionary<NSDate *, NSMutableArray<ECNNewResponse *> *> *separatedByDatesStartDay =
        [self separatedByDatesStartDay:presenterModel.list];
    
    NSArray<ECNMainTableModel *> *contentTable =
        [self contentTable:separatedByDatesStartDay];
    
    ECNMainViewModel *mainViewModel =
        [ECNMainViewModel initWithNewsByDate:contentTable];
    [self.output displayChangeWithViewModel:mainViewModel];
}


- (NSMutableDictionary<NSDate *, NSMutableArray<ECNNewResponse *> *> *)separatedByDatesStartDay:(NSArray<ECNNewResponse *> *)list {
    NSMutableDictionary<NSDate *, NSMutableArray<ECNNewResponse *> *> *result =
        NSMutableDictionary.alloc.init;
    
    for (ECNNewResponse *ecvNewResponse in list) {
        NSDate *dateAtStartOfDay = ecvNewResponse.date.dateAtStartOfDay;
        
        if (dateAtStartOfDay) {
            NSMutableArray *listNews = nil;

            if (!(listNews = result[dateAtStartOfDay])) {
                listNews = NSMutableArray.alloc.init;
                result[dateAtStartOfDay] = listNews;
            }
            [listNews addObject:ecvNewResponse];
        }
    }
    return result;
}


- (NSArray<ECNMainTableModel *> *)contentTable:(NSMutableDictionary<NSDate *,
                                                NSMutableArray<ECNNewResponse *> *> *)dic {
    NSMutableArray<ECNMainTableModel *> *result = NSMutableArray.alloc.init;
    
    NSArray<NSDate *> *sortDates =
        [dic.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSDate *date1,
                                                                    NSDate *date2) {
            return ([date1 compare:date2] == NSOrderedAscending);
        }];
    NSDateFormatter *formatter = NSDateFormatter.formatterYYYYdashMMdashDD;
    
    for (NSDate *date in sortDates) {
        NSArray<ECNNewResponse *> *list =
            [dic[date] sortedArrayUsingComparator:^NSComparisonResult(ECNNewResponse *newResponse1,
                                                                      ECNNewResponse *newResponse2) {
                return ([newResponse1.date compare:newResponse2.date] == NSOrderedAscending);
            }];
        [result addObject:[ECNMainTableModel initWithTitleSection:[formatter stringFromDate:date]
                                                             list:list]];
    }
    return result;
}
@end
