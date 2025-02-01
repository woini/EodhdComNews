//  ECNDetailNewsVC.m
//  Created on 01.02.2025.


#import "ECNDetailNewsVC.h"
#import "ECNDetailNewsBoundaryModels.h"
#import "ECNDetailNewsRouter.h"


@interface ECNDetailNewsVC ()
@property (atomic, weak) IBOutlet UILabel *olContent;
@property (atomic, weak) IBOutlet UIButton *obLink;

@property (atomic, strong) ECNDetailNewsViewModel *viewModel;
@end


@implementation ECNDetailNewsVC
#pragma mark - Object lifecycle
+ (void)injectDependenciesForViewController:(ECNDetailNewsVC *)viewController {
    if (viewController.output != nil) {
        return;
    }
    
    ECNDetailNewsRouter *router = ECNDetailNewsRouter.alloc.init;
    router.viewController = viewController;
    viewController.router = router;
    
    ECNDetailNewsPresenter *presenter = ECNDetailNewsPresenter.alloc.init;
    ECNDetailNewsInteractor *interactor = ECNDetailNewsInteractor.alloc.init;
    viewController.output = interactor;
    interactor.output = presenter;
    presenter.output = viewController;
}


- (instancetype)init {
    if ((self = [super initWithNibName:nil bundle:nil])) {
        [ECNDetailNewsVC injectDependenciesForViewController:self];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [ECNDetailNewsVC injectDependenciesForViewController:self];
    }
    return self;
}


#pragma mark - Display logic
- (void)displayChangeWithViewModel:(ECNDetailNewsViewModel *)viewModel {
    self.viewModel = viewModel;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.olContent.text = self.viewModel.content;
        [self.obLink setTitle:self.viewModel.link forState:UIControlStateNormal];
    });
}


- (IBAction)abLink:(UIButton *)obLink {
    [self.router openLink:self.viewModel.link];
}
@end
