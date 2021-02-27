//
//  ViewController.m
//  05UITableViewDemo1
//
//  Created by liusicheng on 2021/2/25.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

/**
    1. 设置数据源对象
    2. 让数据源对象遵守UITableViewDataSource协议
    3. 在数据源对象中实现UITableViewDataSource协议的方法
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    设置数据源
    self.tableView.dataSource = self;
    
}

//--------------------- UITableView的数据源方法 ---------------------
//    1. 设置TableView显示成几组，默认一组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//    2. 设置UITableView每组显示几行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

//    3. 设置UITableView每一组的每一行显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"Hello";
    return cell;
}

@end
