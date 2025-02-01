//  ECNDetailNewsRouter.h
//  Created on 01.02.2025.


@class ECNDetailNewsVC;


@interface ECNDetailNewsRouter: NSObject
@property (nonatomic, weak) ECNDetailNewsVC *viewController;
+ (ECNDetailNewsVC *)createECNDetailNewsVC;
- (void)openLink:(NSString *)link;
@end
