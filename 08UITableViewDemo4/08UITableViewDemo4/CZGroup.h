//
//  CZGroup.h
//  08UITableViewDemo4
//
//  Created by liusicheng on 2021/2/26.
//

#import <Foundation/Foundation.h>
#import "CZcar.h"

NS_ASSUME_NONNULL_BEGIN

@interface CZGroup : NSObject

@property (nonatomic,strong) NSArray* cars;
@property (nonatomic,copy) NSString* title;

- (instancetype) initWithDict:(NSDictionary*) dict;
+ (instancetype) groupWithDict:(NSDictionary*) dict;

@end

NS_ASSUME_NONNULL_END
