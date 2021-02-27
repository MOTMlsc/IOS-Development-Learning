//
//  CZcar.m
//  08UITableViewDemo4
//
//  Created by liusicheng on 2021/2/26.
//

#import "CZcar.h"

@implementation CZcar

- (instancetype) initWithDict:(NSDictionary *)dict {
    if([super init] != nil){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype) carWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
