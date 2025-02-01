//  ECNDetailNewsInteractor.h
//  Created on 01.02.2025.


@class ECNDetailNewsBeginInteractorModel,
	ECNDetailNewsInteractorModel,
	ECNDetailNewsBeginPresenterModel,
	ECNDetailNewsPresenterModel;


@protocol ECNDetailNewsInteractorInput
- (void)doChangeWithInteractorModel:(ECNDetailNewsInteractorModel *)interactorModel;
@end


@protocol ECNDetailNewsInteractorOutput
- (void)presentChangeWithPresenterModel:(ECNDetailNewsPresenterModel *)presenterModel;
@end


@interface ECNDetailNewsInteractor: NSObject <ECNDetailNewsInteractorInput>
@property (nonatomic) id<ECNDetailNewsInteractorOutput> output;
@end

