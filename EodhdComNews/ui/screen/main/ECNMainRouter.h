//  ECNMainRouter.h
//  Created on 01.02.2025.


#import "ECNNewResponse.h"

@class ECNMainVC;


@interface ECNMainRouter: NSObject
@property (nonatomic, weak) ECNMainVC *viewController;
- (void)showDetailNewsWithContent:(ECNNewResponse *)ecnNewResponse;
@end
