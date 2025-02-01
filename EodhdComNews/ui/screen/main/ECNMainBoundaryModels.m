//  ECNMainBoundaryModels.m
//  Created on 01.02.2025.


#import "ECNMainBoundaryModels.h"
@interface ECNMainInteractorModel()
@property (readwrite) NSDate *date;
@end
@implementation ECNMainInteractorModel
+ (ECNMainInteractorModel *)initWithDate:(NSDate *)date {
    ECNMainInteractorModel *item = ECNMainInteractorModel.alloc.init;
    if (item) {
        item.date = date;
    }
    return item;
}


#ifdef DEBUG
- (NSString *)description {
    return [NSString stringWithFormat:@"<"
        "'%@' "
        "date'%@' "
        ">",
        super.description,
        self.date
        ];
}
#endif
@end


@interface ECNMainPresenterModel()
@property (readwrite) NSArray<ECNNewResponse *> *list;
@end
@implementation ECNMainPresenterModel
+ (ECNMainPresenterModel *)initWithList:(NSArray<ECNNewResponse *> *)list {
    ECNMainPresenterModel *item = ECNMainPresenterModel.alloc.init;
    if (item) {
        item.list = list;
    }
    return item;
}


#ifdef DEBUG
- (NSString *)description {
    return [NSString stringWithFormat:@"<"
        "'%@' "
        "list'%@'"
        ">",
        super.description,
        self.list
        ];
}
#endif
@end


@interface ECNMainTableModel()
@property (readwrite) NSString *titleSection;
@property (readwrite) NSArray<ECNNewResponse *> *list;
@end
@implementation ECNMainTableModel
+ (ECNMainTableModel *)initWithTitleSection:(NSString *)titleSection
                                       list:(NSArray<ECNNewResponse *> *)list {
    ECNMainTableModel *item = ECNMainTableModel.alloc.init;
    if (item) {
        item.titleSection = titleSection;
        item.list = list;
    }
    return item;
}


#ifdef DEBUG
- (NSString *)description {
    return [NSString stringWithFormat:@"<"
        "'%@' "
        "titleSection'%@' "
        "list'%@'"
        ">",
        super.description,
        self.titleSection,
        self.list
        ];
}
#endif
@end


@interface ECNMainViewModel()
@property (readwrite) NSArray<ECNMainTableModel *> *newsByDate;
@end
@implementation ECNMainViewModel
+ (ECNMainViewModel *)initWithNewsByDate:(NSArray<ECNMainTableModel *> *)newsByDate {
    ECNMainViewModel *item = ECNMainViewModel.alloc.init;
    if (item) {
        item.newsByDate = newsByDate;
    }
    return item;
}


#ifdef DEBUG
- (NSString *)description {
    return [NSString stringWithFormat:@"<"
        "'%@' "
        "newsByDate'%@'"
        ">",
        super.description,
        self.newsByDate
        ];
}
#endif
@end
