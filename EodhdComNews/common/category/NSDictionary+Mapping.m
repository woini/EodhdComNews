// NSDictionary+Mapping.m
// Created by 01.02.2025.
        

#import "NSDictionary+Mapping.h"
#import "ECNNewResponse.h"
#import "NSDateFormatter+Utilities.h"
#import "NSDate+Utilities.h"

@implementation NSDictionary (Mapping)
- (void)mappingEodhdNews {
    NSString *strDate = self[@"date"];
    NSString *title = self[@"title"];
    
    if (strDate.length > 0
        && title.length > 0) {
        ECNNewResponse *item = ECNNewResponse.createMObject;
        NSDateFormatter *dateFormatter = NSDateFormatter.dateTimeFormatterYYYYMMddThhmmssZZZZ;
        item.date = [dateFormatter dateFromString:strDate].withoutGMT;
        item.title = title;

        NSUInteger hash = [NSString stringWithFormat:@"%@%@", strDate, item.title].hash;
        item.dateTitleHash = hash;
        item.content = self[@"content"];
        item.link = self[@"link"];
        item.symbols = self[@"symbols"];
        item.tags = self[@"tags"];
        NSDictionary *dicSentiment = self[@"sentiment"];
    
        if ([dicSentiment isKindOfClass:NSDictionary.class]) {
            item.sentiment = self.mappingEodhdNewsSentiment;
        }
    }
}


- (ECNNewSentimentResponse *)mappingEodhdNewsSentiment {
    ECNNewSentimentResponse *item = ECNNewSentimentResponse.createMObject;
    item.polarity = [self[@"polarity"] doubleValue];
    item.neg = [self[@"neg"] doubleValue];
    item.neu = [self[@"neu"] doubleValue];
    item.pos = [self[@"pos"] doubleValue];
    return item;
}
@end
