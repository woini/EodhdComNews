// ECNApp.m
// Created by 01.02.2025.

#import "ECNApp.h"

@interface ECNApp() <UIApplicationDelegate>
@property (readwrite) ECNApiManager *apiManager;
@property (readwrite) CoreDataHelper *coreDataHelper;
@end

@implementation ECNApp
+ (ECNApp *)sharedApp {
    return (ECNApp *)self.sharedApplication;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        [self startWork];
    }
    return self;
}


- (void)startWork {
    self.apiManager = ECNApiManager.alloc.init;
    self.coreDataHelper = CoreDataHelper.alloc.init;
}
@end
