// ECNApiManager+Helper.h
// Created by 01.02.2025.

@interface ECNApiManager (Helper)
- (void)configureUrlSession;
- (NSString *)pathWithSuffix:(NSString *)suffix;
+ (NSString *)token;
+ (NSDictionary *)defaultHeaders;
@end
