// ECNMainCell.m
// Created by 01.02.2025.
        

#import "ECNMainCell.h"
#import "NSDateFormatter+Utilities.h"

@interface ECNMainCell()
@property (nonatomic, weak) IBOutlet UIImageView *oivIcon;
@property (nonatomic, weak) IBOutlet UILabel *olTitle;
@end

@implementation ECNMainCell
- (void)setModel:(ECNNewResponse *)model {
    _model = model;
    [self updateUiByModel];
}


- (void)updateUiByModel {
    NSMutableArray *listContent = NSMutableArray.alloc.init;
    NSDateFormatter *dateFormatter = NSDateFormatter.dateTimeFormatterHHmm;
    NSDate *date = self.model.date;
    
    if (date) {
        [listContent addObject:[dateFormatter stringFromDate:date]];
    }
    NSString *title = self.model.title;
    
    if (title.length > 0) {
        [listContent addObject:title];
    }
    self.olTitle.text =
        [listContent componentsJoinedByString:@"\n"];
}
@end
