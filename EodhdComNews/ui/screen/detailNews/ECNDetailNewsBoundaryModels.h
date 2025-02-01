//  ECNDetailNewsBoundaryModels.h
//  Created on 01.02.2025.


#import "ECNNewResponse.h"
@interface ECNDetailNewsInteractorModel: NSObject
@property (atomic, strong, readonly) ECNNewResponse *ecnNewResponse;
+ (ECNDetailNewsInteractorModel *)initWithEcnNewResponse:(ECNNewResponse *)ecnNewResponse;
@end


@interface ECNDetailNewsPresenterModel: NSObject
@property (atomic, strong, readonly) ECNNewResponse *ecnNewResponse;
+ (ECNDetailNewsPresenterModel *)initWithEcnNewResponse:(ECNNewResponse *)ecnNewResponse;
@end


@interface ECNDetailNewsViewModel: NSObject
@property (atomic, strong, readonly) NSString *content;
@property (atomic, strong, readonly) NSString *link;
+ (ECNDetailNewsViewModel *)initWithContent:(NSString *)content
                                       link:(NSString *)link;
@end
