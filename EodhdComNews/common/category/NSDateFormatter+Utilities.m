// NSDateFormatter+Utilities.m
// Created by 01.02.2025.
        

#import "NSDateFormatter+Utilities.h"

@implementation NSDateFormatter (Utilities)
+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = NSDateFormatter.alloc.init;
    [dateFormatter setDateFormat:format];
    [dateFormatter setLocale:NSLocale.currentLocale];
    [dateFormatter setTimeZone:NSTimeZone.systemTimeZone];
    return dateFormatter;
}


+ (NSDateFormatter *)dateTimeFormatterYYYYMMddThhmmssZZZZ {
    return [self dateFormatterWithFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
}


+ (NSDateFormatter *)dateTimeFormatterYYYYMMddThhmm {
    return [self dateFormatterWithFormat:@"yyyy-MM-dd'T'HH:mm"];
}


+ (NSDateFormatter *)formatterYYYYdashMMdashDD {
    return [self dateFormatterWithFormat:@"yyyy-MM-dd"];
}


+ (NSDateFormatter *)dateTimeFormatterHHmm {
    return [self dateFormatterWithFormat:@"HH:mm"];
}
@end
