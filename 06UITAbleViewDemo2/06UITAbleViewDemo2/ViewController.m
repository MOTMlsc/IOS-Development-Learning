//
//  ViewController.m
//  06UITAbleViewDemo2
//
//  Created by liusicheng on 2021/2/25.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) return 3;
    else if(section == 1) return 2;
    else return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if(indexPath.section == 0){
        if(indexPath.row == 0) cell.textLabel.text = @"中国";
        else if (indexPath.row == 1) cell.textLabel.text = @"日本";
        else cell.textLabel.text = @"韩国";
    }
    else if(indexPath.section == 1){
        if(indexPath.row == 0) cell.textLabel.text = @"英国";
        else cell.textLabel.text = @"法国";
    }
    else cell.textLabel.text = @"南非";
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) return @"亚洲";
    else if(section == 1) return @"欧洲";
    else return @"非洲";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if(section == 0) return @"亚洲⬆️";
    else if(section == 1) return @"欧洲⬆️";
    else return @"非洲⬆️";
}


@end
