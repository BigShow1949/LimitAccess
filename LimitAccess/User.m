//
//  User.m
//  LimitAccess
//
//  Created by apple on 17/3/1.
//  Copyright © 2017年 BigShow1949. All rights reserved.
//

#import "User.h"

@implementation User

+ (instancetype)userWithDict:(NSDictionary *)dict {

    User *user = [[User alloc] init];
    user.name = dict[@"name"];
    user.buyTime = dict[@"buyTime"];
    user.limitTime = dict[@"limitTime"];
    user.udid = dict[@"udid"];
    return user;
}
@end
