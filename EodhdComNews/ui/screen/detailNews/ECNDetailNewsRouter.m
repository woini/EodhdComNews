//  ECNDetailNewsRouter.m
//  Created on 01.02.2025.


#import "ECNDetailNewsRouter.h"
#import "ECNDetailNewsBoundaryModels.h"
#import "ECNDetailNewsVC.h"


@implementation ECNDetailNewsRouter
+ (ECNDetailNewsVC *)createECNDetailNewsVC {
    NSString *name = className(ECNDetailNewsVC.class);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    return storyboard.instantiateInitialViewController;
}


- (void)openLink:(NSString *)link {
    NSURL *url = nil;
    
    if (link.length
        && (url = [NSURL.alloc initWithString:link])) {
        [ECNApp.sharedApp openURL:[NSURL.alloc initWithString:link]
                          options:@{}
                completionHandler:nil];
    }
}
@end
