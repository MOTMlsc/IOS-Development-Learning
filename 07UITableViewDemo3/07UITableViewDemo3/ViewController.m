//
//  ViewController.m
//  07UITableViewDemo3
//
//  Created by liusicheng on 2021/2/26.
//

#import "ViewController.h"
#import "CZGroup.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *groups;

@end

@implementation ViewController

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    CZGroup *group = self.groups[section];
    return group.title;
}



//    重写groups的get方法
- (NSArray*)groups {
    /**
        加载数据：
        1. 获取plist路径
        2. 读取plist文件
        3. 建立模型（一个NSMutableArray）
        4. 将字典中的内容加入到模型中
     */
    if(_groups == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModel = [NSMutableArray array];
        for(NSDictionary *dict in arrayDict){
            CZGroup *model = [CZGroup groupWithDict:dict];
            [arrayModel addObject:model];
        }
        _groups = arrayModel;
    }
    
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@",self.groups);
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CZGroup *group = self.groups[section];
    return group.cars.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CZGroup *group = self.groups[indexPath.section];
    NSDictionary *car = group.cars[indexPath.row];
    NSString *brand = car[@"name"];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = brand;
    return cell;
}

@end
