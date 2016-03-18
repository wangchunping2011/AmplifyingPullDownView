//
//  ViewController.m
//  TestDemo
//
//  Created by 王春平 on 16/3/15.
//  Copyright © 2016年 wang. All rights reserved.
//

#import "ViewController.h"
#import "AmplifyingPullDownView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) AmplifyingPullDownView *pullDownView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
    
    self.pullDownView = [[AmplifyingPullDownView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), PullDownViewHeight)];
    //把pullDownView设置为tableView的headerView
    self.tableView.tableHeaderView = self.pullDownView;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //当下拉时，传入scrollView的偏移量
    [self.pullDownView amplifyingWithContentOffset:scrollView.contentOffset];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据%d", indexPath.row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
