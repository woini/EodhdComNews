// ECNApp.h
// Created by 01.02.2025.

#import "ECNApiManagerClass.h"
#import "CoreDataHelper.h"

@interface ECNApp : UIApplication

@property (nonatomic, strong, readonly) ECNApiManager *apiManager;
@property (nonatomic, strong, readonly) CoreDataHelper *coreDataHelper;

+ (ECNApp *)sharedApp;
@end
