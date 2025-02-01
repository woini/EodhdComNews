// NSDate+Utilities.h
// Created by 01.02.2025.
 

@interface NSDate (Utilities)
- (NSDate *)withoutGMT;
- (NSDate *)dateAtStartOfDay;
- (NSDate *)dateAtEndOfDay;
- (NSDate *)dateYesterday;
@end
