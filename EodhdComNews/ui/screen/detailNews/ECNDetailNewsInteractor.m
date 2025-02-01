//  ECNDetailNewsInteractor.m
//  Created on 01.02.2025.


#import "ECNDetailNewsInteractor.h"
#import "ECNDetailNewsBoundaryModels.h"


@interface ECNDetailNewsInteractor ()
@end


@implementation ECNDetailNewsInteractor
#pragma mark - Business logic
- (void)doChangeWithInteractorModel:(ECNDetailNewsInteractorModel *)interactorModel {
    ECNDetailNewsPresenterModel *presenterModel =
        [ECNDetailNewsPresenterModel initWithEcnNewResponse:interactorModel.ecnNewResponse];
    [self.output presentChangeWithPresenterModel:presenterModel];
}
@end
