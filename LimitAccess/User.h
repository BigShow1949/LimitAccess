//
//  User.h
//  LimitAccess
//
//  Created by apple on 17/3/1.
//  Copyright © 2017年 BigShow1949. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *udid;
@property (nonatomic, strong) NSString *buyTime;
@property (nonatomic, strong) NSString *limitTime;

+ (instancetype)userWithDict:(NSDictionary *)dict;
@end
