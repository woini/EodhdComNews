// ECNNewsRequest.h
// Created by 01.02.2025.

#import "ECNModelRequest.h"

@interface ECNNewsRequest : ECNModelRequest
/// REQUIRED if parameter ‘t’ is not set. The ticker code to get news for.
@property (atomic, strong) NSString *s;
/// REQUIRED if parameter ‘s’ is not set. The tag to get news on a given topic. The list of supported topics you can find at the bottom of this page:
@property (atomic, strong) NSString *t;
/// REQUIRED. Your api_token to access the API. You will get it after registration.
@property (atomic, strong) NSString *apiToken;
/// the format is ‘YYYY-MM-DD’. If you need data from Mar 1, 2021, to Mar 10, 2021, you should use from=2021-03-01 and to=2021-03-10.
@property (atomic, strong) NSDate *from;
/// the format is ‘YYYY-MM-DD’. If you need data from Mar 1, 2021, to Mar 10, 2021, you should use from=2021-03-01 and to=2021-03-10.
@property (atomic, strong) NSDate *to;
/// OPTIONAL. The number of results should be returned with the query. Default value: 50, minimum value: 1, maximum value: 1000.
@property (atomic, strong) NSNumber *limit;
/// OPTIONAL. The offset of the data. Default value: 0, minimum value: 0. For example, to get 100 symbols starting from 200 you should use limit=100 and offset=200.
@property (atomic, strong) NSNumber *offset;

+ (ECNNewsRequest *)initWithS:(NSString *)s
                            t:(NSString *)t
                     apiToken:(NSString *)apiToken
                         from:(NSDate *)from
                           to:(NSDate *)to
                        limit:(NSNumber *)limit
                       offset:(NSNumber *)offset;

@end
