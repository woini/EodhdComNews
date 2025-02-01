//  ECNDetailNewsBoundaryModels.m
//  Created on 01.02.2025.


#import "ECNDetailNewsBoundaryModels.h"
@interface ECNDetailNewsInteractorModel()
@property (readwrite) ECNNewResponse *ecnNewResponse;


@end
@implementation ECNDetailNewsInteractorModel
+ (ECNDetailNewsInteractorModel *)initWithEcnNewResponse:(ECNNewResponse *)ecnNewResponse {
    ECNDetailNewsInteractorModel *item = ECNDetailNewsInteractorModel.alloc.init;
    if (item) {
        item.ecnNewResponse = ecnNewResponse;
    }
    return item;
}


#ifdef DEBUG
- (NSString *)description {
    return [NSString stringWithFormat:@"<"
            "'%@' "
            "ecnNewResponse'%@'"
            ">",
            super.description,
            self.ecnNewResponse
            ];
}
#endif
@end


@interface ECNDetailNewsPresenterModel()
@property (readwrite) ECNNewResponse *ecnNewResponse;
@end
@implementation ECNDetailNewsPresenterModel
+ (ECNDetailNewsPresenterModel *)initWithEcnNewResponse:(ECNNewResponse *)ecnNewResponse {
    ECNDetailNewsPresenterModel *item = ECNDetailNewsPresenterModel.alloc.init;
    if (item) {
        item.ecnNewResponse = ecnNewResponse;
    }
    return item;
}


#ifdef DEBUG
- (NSString *)description {
    return [NSString stringWithFormat:@"<"
            "'%@' "
            "ecnNewResponse'%@'"
            ">",
            super.description,
            self.ecnNewResponse
            ];
}
#endif
@end


@interface ECNDetailNewsViewModel()
@property (readwrite) NSString *content;
@property (readwrite) NSString *link;
@end
@implementation ECNDetailNewsViewModel
+ (ECNDetailNewsViewModel *)initWithContent:(NSString *)content
                                            link:(NSString *)link {
    ECNDetailNewsViewModel *item = ECNDetailNewsViewModel.alloc.init;
    if (item) {
        item.content = content;
        item.link = link;
    }
    return item;
}


#ifdef DEBUG
- (NSString *)description {
    return [NSString stringWithFormat:@"<"
            "'%@' "
            "content'%@' "
            "link'%@'"
            ">",
            super.description,
            self.content,
            self.link
            ];
}
#endif
@end
