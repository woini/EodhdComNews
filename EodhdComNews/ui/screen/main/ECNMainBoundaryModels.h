//  ECNMainBoundaryModels.h
//  Created on 01.02.2025.


#import "ECNNewResponse.h"
@interface ECNMainInteractorModel: NSObject
@property (atomic, strong, readonly) NSDate *date;
+ (ECNMainInteractorModel *)initWithDate:(NSDate *)date;
@end


@interface ECNMainPresenterModel: NSObject
@property (atomic, strong, readonly) NSArray<ECNNewResponse *> *list;
+ (ECNMainPresenterModel *)initWithList:(NSArray<ECNNewResponse *> *)list;
@end


@interface ECNMainTableModel: NSObject
@property (atomic, strong, readonly) NSString *titleSection;
@property (atomic, strong, readonly) NSArray<ECNNewResponse *> *list;
+ (ECNMainTableModel *)initWithTitleSection:(NSString *)titleSection
                                       list:(NSArray<ECNNewResponse *> *)list;
@end


@interface ECNMainViewModel: NSObject
@property (atomic, strong, readonly) NSArray<ECNMainTableModel *> *newsByDate;
+ (ECNMainViewModel *)initWithNewsByDate:(NSArray<ECNMainTableModel *> *)newsByDate;
@end
