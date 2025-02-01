//  ECNMainInteractor.h
//  Created on 01.02.2025.


@class ECNMainBeginInteractorModel,
	ECNMainInteractorModel,
	ECNMainBeginPresenterModel,
	ECNMainPresenterModel;


@protocol ECNMainInteractorInput
- (void)doStartWithBeginInteractor;
- (void)doChangeWithInteractorModel:(ECNMainInteractorModel *)interactorModel;
@end


@protocol ECNMainInteractorOutput
- (void)presentChangeWithPresenterModel:(ECNMainPresenterModel *)presenterModel;
@end


@interface ECNMainInteractor: NSObject <ECNMainInteractorInput>
@property (nonatomic) id<ECNMainInteractorOutput> output;
@end

