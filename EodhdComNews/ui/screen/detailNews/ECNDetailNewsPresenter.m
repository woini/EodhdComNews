//  ECNDetailNewsPresenter.m
//  Created on 01.02.2025.


#import "ECNDetailNewsPresenter.h"
#import "ECNDetailNewsBoundaryModels.h"
#import "NSDateFormatter+Utilities.h"

@interface ECNDetailNewsPresenter ()
@end


@implementation ECNDetailNewsPresenter
#pragma mark - Presentation logic
- (void)presentChangeWithPresenterModel:(ECNDetailNewsPresenterModel *)presenterModel {
    NSMutableArray *displayList = NSMutableArray.alloc.init;

    if (presenterModel.ecnNewResponse.date) {
        NSDateFormatter *dateFormatter = NSDateFormatter.dateTimeFormatterYYYYMMddThhmm;
        [displayList addObject:[dateFormatter stringFromDate:presenterModel.ecnNewResponse.date]];
    }
    
    if (presenterModel.ecnNewResponse.title) {
        [displayList addObject:presenterModel.ecnNewResponse.title];
    }
    
    if (presenterModel.ecnNewResponse.content) {
        [displayList addObject:presenterModel.ecnNewResponse.content];
    }

    ECNDetailNewsViewModel *viewModel =
        [ECNDetailNewsViewModel initWithContent:[displayList componentsJoinedByString:@"\n\n"]
                                           link:presenterModel.ecnNewResponse.link];
    [self.output displayChangeWithViewModel:viewModel];
}
@end
