//  ECNDetailNewsVC.h
//  Created on 01.02.2025.


#import "ECNDetailNewsInteractor.h"
#import "ECNDetailNewsPresenter.h"
#import "ECNDetailNewsRouter.h"

@protocol ECNDetailNewsInteractorInput;
@protocol ECNDetailNewsPresenterOutput;

@interface ECNDetailNewsVC: UIViewController <ECNDetailNewsPresenterOutput>
@property (atomic) id<ECNDetailNewsInteractorInput> output;
@property (atomic) ECNDetailNewsRouter *router;
@end
