// ECNNewSentimentResponse.h
// Created by 01.02.2025.


#import <CoreData/CoreData.h>

@interface ECNNewSentimentResponse : NSManagedObject
@property (assign, nonatomic) double polarity;
@property (assign, nonatomic) double neg;
@property (assign, nonatomic) double neu;
@property (assign, nonatomic) double pos;
@end
