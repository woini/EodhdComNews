// ECNApiManager+Helper.m
// Created by 01.02.2025.

#import "ECNApiManager+Helper.h"

@interface ECNApiManager()
@property (readwrite) NSURLSession *urlSession;
@end


@implementation ECNApiManager (Helper)
- (void)configureUrlSession {
    NSURLSessionConfiguration *configuration = NSURLSessionConfiguration.defaultSessionConfiguration;
    [configuration setHTTPAdditionalHeaders:self.class.defaultHeaders];
    self.urlSession = [NSURLSession sessionWithConfiguration:configuration];
}


- (NSString *)baseUrl {
    return @"https://eodhd.com/api";
}


+ (NSString *)token {
    dLog(@" нужен ключ api\nhttps://eodhd.com/financial-apis/quick-start-with-our-financial-data-apis ")
    return @"<#Ключ API (токен)#>";
}


- (NSString *)pathWithSuffix:(NSString *)suffix {
    NSString *baseUrl = self.baseUrl;
    NSString *result = [NSString stringWithFormat:@"%@/%@", baseUrl, suffix];
    return result;
}


+ (NSDictionary *)defaultHeaders {
    NSMutableDictionary *result = NSMutableDictionary.alloc.init;
    result[@"accept"] = @"application/json";
    result[@"content-type"] = @"application/json";
    result[@"api_token"] = self.token;
    return result;
}
@end
