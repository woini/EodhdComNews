// ECNApiManager.m
// Created by 01.02.2025.
        

#import "ECNApiManager.h"
#import "ECNApiManagerClass.h"

@interface ECNApiManager() <NSURLSessionTaskDelegate>
@property (readwrite) NSURLSession *urlSession;
@end

/// https://eodhd.com/financial-apis/stock-market-financial-news-api
@implementation ECNApiManager
- (instancetype)init {
    self = [super init];
    if (self) {
        [self configureUrlSession];
    }
    return self;
}


- (NSMutableURLRequest *)requestWithSuffix:(NSString *)suffix
                                parameters:(ECNModelRequest *)parameters {
    NSURL *url =
        [self urlWithSuffix:suffix parameters:parameters];
    
    return
        [NSMutableURLRequest requestWithURL:url
                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                            timeoutInterval:30.0];
}


- (void)get:(NSString *)suffix
  parameters:(ECNModelRequest *)parameters
    success:(void (^)(__kindof NSObject *obj))success
     failure:(void (^)(NSError *error))failure {
    
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSMutableURLRequest *request =
            [self requestWithSuffix:suffix
                         parameters:parameters];
        request.HTTPMethod = @"GET";
        [request setAllHTTPHeaderFields:ECNApiManager.defaultHeaders];
        NSURLSessionDataTask *dataTask =
            [self.urlSession dataTaskWithRequest:request
                               completionHandler:^(NSData * _Nullable data,
                                                   NSURLResponse * _Nullable response,
                                                   NSError * _Nullable error) {

                if (error) {
                    if (failure) {
                        failure(error);
                    }

                } else {
                NSObject *obj =
                    [NSJSONSerialization JSONObjectWithData:data
                                                    options:NSJSONReadingAllowFragments
                                                      error:nil];
                    if (success) {
                        success(obj);
                    }
                }
            }];
        [dataTask resume];
    });
}


- (NSURL *)urlWithSuffix:(NSString *)suffix
              parameters:(ECNModelRequest *)parameters {
    NSString *query = [self componentsQueryWithParameters:parameters];
    NSString *validSuffix = suffix && query
        ? [NSString stringWithFormat:@"%@?%@", suffix, query]
        : suffix;
    
    NSURL *url = [NSURL.alloc initWithString:[self pathWithSuffix:validSuffix]];
    return url;
}


- (NSString *)componentsQueryWithParameters:(ECNModelRequest *)parameters {
    NSDictionary *dictionary = parameters.getDictionary;
    NSMutableArray<NSURLQueryItem *> *urlItems = NSMutableArray.alloc.init;

    for (NSString *key in dictionary) {
        NSString *value = dictionary[key];

        if (key && value) {
            [urlItems addObject:[NSURLQueryItem queryItemWithName:key value:value]];
        }
    }
    NSURLComponents *components = NSURLComponents.alloc.init;
    components.queryItems = urlItems;
    return components.query;
}
@end
