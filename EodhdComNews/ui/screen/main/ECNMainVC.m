//  ECNMainVC.m
//  Created on 01.02.2025.


#import "ECNMainVC.h"
#import "ECNMainBoundaryModels.h"
#import "ECNMainRouter.h"
#import "ECNMainCell.h"


@interface ECNMainVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *oTableViewNews;
@property (atomic, strong) ECNMainViewModel *viewModel;
@end


@implementation ECNMainVC
#pragma mark - Object lifecycle
+ (void)injectDependenciesForViewController:(ECNMainVC *)viewController {
    if (viewController.output != nil) {
        return;
    }
    
    ECNMainRouter *router = ECNMainRouter.alloc.init;
    router.viewController = viewController;
    viewController.router = router;
    
    ECNMainPresenter *presenter = ECNMainPresenter.alloc.init;
    ECNMainInteractor *interactor = ECNMainInteractor.alloc.init;
    viewController.output = interactor;
    interactor.output = presenter;
    presenter.output = viewController;
}


- (instancetype)init {
    if ((self = [super initWithNibName:nil bundle:nil])) {
        [ECNMainVC injectDependenciesForViewController:self];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [ECNMainVC injectDependenciesForViewController:self];
    }
    return self;
}


#pragma mark - View lifecycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self doSomethingOnAppear];
}


#pragma mark - Event handling
- (void)doSomethingOnAppear {
    [self.output doStartWithBeginInteractor];
    [self setupTable];
}


- (void)setupTable {
    self.oTableViewNews.estimatedRowHeight = 1;
    self.oTableViewNews.rowHeight = UITableViewAutomaticDimension;
    self.oTableViewNews.dataSource = self;
    self.oTableViewNews.delegate = self;
    Class registerClass = ECNMainCell.class;
    UINib *nib =
        [UINib nibWithNibName:className(registerClass) bundle:nil];
    [self.oTableViewNews registerNib:nib forCellReuseIdentifier:className(registerClass)];
}


#pragma mark - Display logic
- (void)displayChangeWithViewModel:(ECNMainViewModel *)viewModel {
    self.viewModel = viewModel;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.oTableViewNews reloadData];
    });
}


- (ECNMainTableModel *)tableModelBySection:(NSUInteger)section {
    return (self.viewModel.newsByDate.count > section)
        ? self.viewModel.newsByDate[section]
        : nil;
}


- (ECNNewResponse *)newsByIndexPath:(NSIndexPath *)indexPath {
    ECNMainTableModel *tableModel = [self tableModelBySection:indexPath.section];
    NSInteger row = indexPath.row;

    return (tableModel.list.count > row)
        ? tableModel.list[row]
        : nil;
}


#pragma mark - table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.newsByDate.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger result =
        [self tableModelBySection:section].list.count;
    return result;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *result =
        [self tableModelBySection:section].titleSection;
    return result;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = className(ECNMainCell.class);
    ECNMainCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
    cell.model = [self newsByIndexPath:indexPath];
    return cell;
}


- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;

    if (row + 1 == self.viewModel.newsByDate.count) {
        NSDate *date = [self newsByIndexPath:indexPath].date;
        [self.output doChangeWithInteractorModel:[ECNMainInteractorModel initWithDate:date]];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    ECNNewResponse *ecnNewResponse = self.viewModel.newsByDate[section].list[row];
    [self.router showDetailNewsWithContent:ecnNewResponse];
}
@end
