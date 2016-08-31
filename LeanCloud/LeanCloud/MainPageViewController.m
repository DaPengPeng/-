//
//  MainPageViewController.m
//  LeanCloud
//
//  Created by yuebin on 16/8/12.
//  Copyright © 2016年 yuebin. All rights reserved.
//

#import "MainPageViewController.h"
#import "LeftDrawerViewController.h"
#import "MMDrawerController.h"
#import "TableViewCell.h"
#import "QueryViewController.h"

@interface MainPageViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UIBarButtonItem *queryItem;

@end

@implementation MainPageViewController {


}

- (UIBarButtonItem *)queryItem {
    if (!_queryItem) {
        _queryItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(pushQueryView)];
    }
    return _queryItem;
}

- (void)pushQueryView {
    
    QueryViewController *queryVC = [[QueryViewController alloc]init];
    [self.navigationController pushViewController:queryVC animated:YES];
    
}





#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"轻松快递";
    self.navigationItem.rightBarButtonItem = self.queryItem;
    [self changeRootView];
    
}

- (void)changeRootView { //更改window的根视图
    
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:self];  //这个方法自创的，会不会有什么问题
    
    LeftDrawerViewController *leftDrawer = [[LeftDrawerViewController alloc]init];
    
    MMDrawerController *mm = [[MMDrawerController alloc]initWithCenterViewController:nvc leftDrawerViewController:leftDrawer];
    mm.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    mm.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    mm.maximumLeftDrawerWidth = 4*KSC_W/5;
    
    [UIApplication sharedApplication].keyWindow.rootViewController = mm;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellMark = @"tableCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellMark];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:nil options:nil]firstObject];

    }
    return cell;
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
