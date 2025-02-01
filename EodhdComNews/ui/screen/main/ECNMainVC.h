//  ECNMainVC.h
//  Created on 01.02.2025.


#import "ECNMainInteractor.h"
#import "ECNMainPresenter.h"


@protocol ECNMainInteractorInput;
@protocol ECNMainPresenterOutput;


@class ECNMainRouter;


@interface ECNMainVC: UIViewController <ECNMainPresenterOutput>
@property (atomic) id<ECNMainInteractorInput> output;
@property (atomic) ECNMainRouter *router;
@end
