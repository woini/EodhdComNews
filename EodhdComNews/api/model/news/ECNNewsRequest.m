// ECNNewsRequest.m
// Created by 01.02.2025.


#import "ECNNewsRequest.h"
#import "NSDateFormatter+Utilities.h"

@implementation ECNNewsRequest
+ (ECNNewsRequest *)initWithS:(NSString *)s
                            t:(NSString *)t
                     apiToken:(NSString *)apiToken
                         from:(NSDate *)from
                           to:(NSDate *)to
                        limit:(NSNumber *)limit
                       offset:(NSNumber *)offset {
    ECNNewsRequest *item = ECNNewsRequest.alloc.init;
    
    if (item) {
        item.s = s;
        item.t = t;
        item.apiToken = apiToken;
        item.from = from;
        item.to = to;
        item.limit = limit;
        item.offset = offset;
    }
    return item;
}


- (NSDictionary *)getDictionary {
    NSDateFormatter *dateFormatter = NSDateFormatter.formatterYYYYdashMMdashDD;
    NSMutableDictionary *result = NSMutableDictionary.alloc.init;
    result[@"s"] = self.s;
    result[@"t"] = self.t;
    result[@"api_token"] = self.apiToken;
    
    if (self.from) {
        result[@"from"] = [dateFormatter stringFromDate:self.from];
    }
    
    if (self.to) {
        result[@"to"] = [dateFormatter stringFromDate:self.to];
    }

    if (self.limit) {
        result[@"limit"] =  [NSString stringWithFormat:@"%@", self.limit];
    }
    
    if (self.offset) {
        result[@"offset"] =  [NSString stringWithFormat:@"%@", self.offset];
    }
    return result;
}


#ifdef DEBUG
- (NSString *)description {
    return [NSString stringWithFormat:@"<"
            @"%@ "
            @"s'%@' "
            @"t'%@' "
            @"apiToken'%@' "
            @"from'%@' "
            @"to'%@' "
            @"limit'%@' "
            @"offset'%@' "
            ">",
            super.description,
            self.s,
            self.t,
            self.apiToken,
            self.from,
            self.to,
            self.limit,
            self.offset
    ];
}
#endif
@end
