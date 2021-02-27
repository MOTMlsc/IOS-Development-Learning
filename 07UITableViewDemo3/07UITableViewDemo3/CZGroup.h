//
//  CZGroup.h
//  07UITableViewDemo3
//
//  Created by liusicheng on 2021/2/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZGroup : NSObject
//    组标题
@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString *desc;
//    汽车信息
@property (nonatomic, strong) NSArray *cars;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
