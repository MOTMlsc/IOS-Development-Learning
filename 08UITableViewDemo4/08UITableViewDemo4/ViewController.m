//
//  ViewController.m
//  08UITableViewDemo4
//
//  Created by liusicheng on 2021/2/26.
//

#import "ViewController.h"
#import "CZGroup.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic,strong) NSArray *groups;

@end

@implementation ViewController

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    CZGroup *group = self.groups[section];
    return group.title;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [self.groups valueForKey:@"title"];
}

- (NSArray*) groups {
    if(_groups==nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModel = [NSMutableArray array];
        for(NSDictionary *dict in arrayDict){
            CZGroup* model = [CZGroup groupWithDict:dict];
            [arrayModel addObject:model];
        }
        _groups = arrayModel;
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    CZGroup* group = self.groups[section];
    return group.cars.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZGroup *group = self.groups[indexPath.section];
    CZcar *car = group.cars[indexPath.row];
    
    static NSString* ID = @"car_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

@end
