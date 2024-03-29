//
//  FDEHomeViewController.m
//  Demon
//
//  Created by xuequan on 2020/1/29.
//  Copyright © 2020 xuequan. All rights reserved.
//

#import "FDEHomeViewController.h"
#import "FDEDetailViewController.h"
#import "FDEItemModel.h"

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
    
    __weak typeof(self) weakSelf = self;
    
    FDEItemModel *one = [FDEItemModel new];
    one.title = @"situation 0 Title";
    one.actionBlk = ^{
        FDEDetailViewController *detailVC = [FDEDetailViewController new];
        detailVC.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailVC animated:YES];
    };
    [self.dataList addObject:one];
    
    FDEItemModel *two = [FDEItemModel new];
    two.title = @"situation 1 Title";
    two.actionBlk = ^{
        FDEDetailViewController *detailVC = [FDEDetailViewController new];
        detailVC.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailVC animated:YES];
    };
    [self.dataList addObject:two];
    
    FDEItemModel *three = [FDEItemModel new];
    three.title = @"situation 2 Title";
    three.actionBlk = ^{
        FDEDetailViewController *detailVC = [FDEDetailViewController new];
        detailVC.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:detailVC animated:YES];
    };
    [self.dataList addObject:three];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FDEItemModel *item = self.dataList[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = item.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FDEItemModel *item = self.dataList[indexPath.row];
    if (item.actionBlk) {
        item.actionBlk();
    }
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
