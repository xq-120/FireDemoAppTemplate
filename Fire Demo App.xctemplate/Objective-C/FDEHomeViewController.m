//
//  FDEHomeViewController.m
//  Demon
//
//  Created by xuequan on 2020/1/29.
//  Copyright © 2020 xuequan. All rights reserved.
//

#import "FDEHomeViewController.h"
#import "FDEDetailViewController.h"

@interface FDEHomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation FDEHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubview];
    
    [self loadData];
}

- (void)setupSubview {
    self.navigationItem.title = @"首页";
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.frame;
}

- (void)loadData {
    [self.dataList removeAllObjects];
    
    NSArray *situations = @[@"situation 0 Title", @"situation 1 Title", @"situation 2 Title"];
    [self.dataList addObjectsFromArray:situations];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *title = self.dataList[indexPath.row];
    cell.textLabel.text = title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FDEDetailViewController *detailVC = [FDEDetailViewController new];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.tableFooterView = UIView.new;
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
        _tableView = tableView;
    }
    return _tableView;
}

@end
