// ECNNewResponse.h
// Created by 01.02.2025.

#import <CoreData/CoreData.h>
#import "ECNNewSentimentResponse.h"
#import "NSManagedObject+Operation.h"

@interface ECNNewResponse : NSManagedObject
@property (atomic, assign) NSInteger dateTitleHash;
/// The date and time of the article are in ISO 8601 format.
@property (atomic, strong) NSDate *date;
/// The title of the article.
@property (atomic, strong) NSString *title;
/// The full body of the article.
@property (atomic, strong) NSString *content;
/// The link to the source.
@property (atomic, strong) NSString *link;
/// The array of ticker symbols is mentioned in the article.
@property (atomic, strong) NSArray *symbols;
@property (atomic, strong) NSArray *tags;
@property (atomic, strong) ECNNewSentimentResponse *sentiment;
@end
