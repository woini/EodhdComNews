//  ECNMainPresenter.h
//  Created on 01.02.2025.


#import "ECNMainInteractor.h"


@protocol ECNMainInteractorOutput;


@class ECNMainBeginViewModel, ECNMainViewModel;


@protocol ECNMainPresenterOutput
- (void)displayChangeWithViewModel:(ECNMainViewModel *)viewModel;
@end


@interface ECNMainPresenter: NSObject <ECNMainInteractorOutput>
@property (nonatomic, weak) id<ECNMainPresenterOutput> output;
@end
