//  ECNMainRouter.m
//  Created on 01.02.2025.


#import "ECNMainRouter.h"
#import "ECNMainBoundaryModels.h"
#import "ECNMainVC.h"
#import "ECNDetailNewsVC.h"
#import "ECNDetailNewsRouter.h"
#import "AppDelegate.h"
#import "ECNDetailNewsBoundaryModels.h"

@implementation ECNMainRouter
- (void)showDetailNewsWithContent:(ECNNewResponse *)ecnNewResponse {
    ECNDetailNewsVC *createECNDetailNewsVC =
        ECNDetailNewsRouter.createECNDetailNewsVC;
    ECNDetailNewsInteractorModel *interactorModel =
        [ECNDetailNewsInteractorModel initWithEcnNewResponse:ecnNewResponse];
    
    [createECNDetailNewsVC.output doChangeWithInteractorModel:interactorModel];
    [self.currentNavigationController pushViewController:createECNDetailNewsVC
                                                animated:true];
}


- (UINavigationController *)currentNavigationController {
    UINavigationController *result = self.viewController.navigationController;
    
    if (!self.viewController.navigationController) {
        UIWindow *window =
            [self windowForRootViewController:self.viewController];
        window.rootViewController = nil;
        result = [UINavigationController.alloc initWithRootViewController:self.viewController];
        window.rootViewController = result;
    }
    return result;
}


- (UIWindow *)windowForRootViewController:(UIViewController *)viewController {
    UIWindow *result = nil;
    NSArray<UIScene *> *scenes = UIApplication.sharedApplication.connectedScenes.allObjects;

    for (UIScene *scene in scenes) {
        if ([scene isKindOfClass:UIWindowScene.class]) {
            NSArray<UIWindow *> *windows = ((UIWindowScene *)scene).windows;
            for (UIWindow *window in windows) {
                
                if (window.rootViewController == viewController) {
                    result = window;
                    break;
                }
            }
        }
    }
    return result;
}
@end
