//  ECNDetailNewsPresenter.h
//  Created on 01.02.2025.


#import "ECNDetailNewsInteractor.h"


@protocol ECNDetailNewsInteractorOutput;


@class ECNDetailNewsBeginViewModel,
    ECNDetailNewsViewModel;


@protocol ECNDetailNewsPresenterOutput
- (void)displayChangeWithViewModel:(ECNDetailNewsViewModel *)viewModel;
@end


@interface ECNDetailNewsPresenter: NSObject <ECNDetailNewsInteractorOutput>
@property (nonatomic, weak) id<ECNDetailNewsPresenterOutput> output;
@end
