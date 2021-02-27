//
//  CZcar.h
//  08UITableViewDemo4
//
//  Created by liusicheng on 2021/2/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZcar : NSObject
@property(nonatomic,copy) NSString* icon;
@property(nonatomic,copy) NSString* name;

- (instancetype) initWithDict:(NSDictionary*) dict;
+ (instancetype) carWithDict:(NSDictionary*) dict;

@end

NS_ASSUME_NONNULL_END
