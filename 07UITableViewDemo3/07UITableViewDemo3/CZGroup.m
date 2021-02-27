//
//  CZGroup.m
//  07UITableViewDemo3
//
//  Created by liusicheng on 2021/2/26.
//

#import "CZGroup.h"

@implementation CZGroup

- (instancetype)initWithDict:(NSDictionary *)dict {
    if(self = [super init]){
//        将字典的键值赋值给对象的属性
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
