// NSDate+Utilities.m
// Created by 01.02.2025.
        

#import "NSDate+Utilities.h"

@implementation NSDate (Utilities)
// Thanks, AshFurrow
static const unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);


+ (NSCalendar *)currentCalendar {
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}


- (NSDate *)withoutGMT {
    NSDateFormatter *dateFormatter = NSDateFormatter.alloc.init;
    NSTimeInterval timeIntervalSince1970 = self.timeIntervalSince1970;
    NSTimeInterval secondsFromGMTForDate = [dateFormatter.timeZone secondsFromGMTForDate:self];
    NSTimeInterval timeInterval = timeIntervalSince1970 - secondsFromGMTForDate;
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}


- (NSDate *)dateAtStartOfDay {
    NSDateComponents *components = [NSDate.currentCalendar components:componentFlags fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [NSDate.currentCalendar dateFromComponents:components];
}


// Thanks gsempe & mteece
- (NSDate *)dateAtEndOfDay {
    NSDateComponents *components = [NSDate.currentCalendar components:componentFlags fromDate:self];
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    return [NSDate.currentCalendar dateFromComponents:components];
}


- (NSDate *)dateYesterday {
    return [self dateByAddingDays:-1];
}


- (NSDate *)dateByAddingDays:(NSInteger)days {
    NSDateComponents *dateComponents = NSDateComponents.alloc.init;
    [dateComponents setDay:days];
    NSDate *newDate = [NSCalendar.currentCalendar dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}
@end
