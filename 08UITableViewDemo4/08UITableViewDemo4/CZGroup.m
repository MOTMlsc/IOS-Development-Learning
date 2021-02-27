//
//  CZGroup.m
//  08UITableViewDemo4
//
//  Created by liusicheng on 2021/2/26.
//

#import "CZGroup.h"

@implementation CZGroup

- (instancetype) initWithDict:(NSDictionary *)dict {
    if([super init] != nil){
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *carArr = [NSMutableArray new];
        for(NSDictionary* cardict in dict[@"cars"]){
            CZcar *car = [CZcar carWithDict:cardict];
            [carArr addObject:car];
        }
        NSArray *carsArray = [carArr copy];
        self.cars = carsArray;
    }
    return self;
}

+ (instancetype) groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
