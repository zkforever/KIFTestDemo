//
//  MainViewController.m
//  KIFUnitTestProject
//
//  Created by zk on 2016/11/17.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "MainViewController.h"
#import "UIView+AccessibilityForDebug.h"
#import "AccessibilityConstants.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource> {
    NSMutableArray *_dataArray;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [NSMutableArray array];
    
    for (int i = 0;i < 10; i++) {
        [_dataArray addObject:[NSString stringWithFormat:@"第%d行",i+1]];
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view setAccessibilityLabelForDebug:AccessibilityConstants.mainView];
    CGRect rect = [[UIScreen mainScreen] bounds];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height - 64)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setAccessibilityLabelForDebug:AccessibilityConstants.mainTable];
    [self.view addSubview:tableView];
    // Do any additional setup after loading the view.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *button = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)
                                    {
                                        [_dataArray removeObjectAtIndex:indexPath.row];
                                        [tableView reloadData];
                                    }];
    return @[button];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
