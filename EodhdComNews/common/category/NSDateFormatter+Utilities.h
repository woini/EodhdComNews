// NSDateFormatter+Utilities.h
// Created by 01.02.2025.


@interface NSDateFormatter (Utilities)
+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format;
+ (NSDateFormatter *)dateTimeFormatterYYYYMMddThhmmssZZZZ;
+ (NSDateFormatter *)dateTimeFormatterYYYYMMddThhmm;
+ (NSDateFormatter *)formatterYYYYdashMMdashDD;
+ (NSDateFormatter *)dateTimeFormatterHHmm;
@end
