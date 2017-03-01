//
//  ViewController.m
//  LimitAccess
//
//  Created by apple on 17/3/1.
//  Copyright © 2017年 BigShow1949. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
@interface ViewController ()
@property (nonatomic, strong) User *user;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.user = [[User alloc] init];
    self.user.udid = @"2222222222";
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"userInfo" ofType:@"plist"];
    NSArray *arr = [[NSArray alloc] initWithContentsOfFile:plistPath];
    for (NSDictionary *dict in arr) {
        User *user = [User userWithDict:dict];
        if ([user.udid isEqualToString:self.user.udid]) {
            self.user = user;
            break;
        }
    }
    
    NSLog(@"name = %@", self.user.name);
    NSLog(@"time = %@", self.user.limitTime);

    
//    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSDate *date = [self getInternetDate];
//    NSLog(@"date = %@", []);
    //  7998b513a9662e7ea97051747153c7fcc61172c2
    
    // Do any additional setup after loading the view, typically from a nib.
}


/**
 
 *  获取网络当前时间
 
 */

- (NSDate *)getInternetDate

{
    
    NSString *urlString = @"http://m.baidu.com";
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    // 实例化NSMutableURLRequest，并进行参数配置
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: urlString]];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [request setTimeoutInterval: 2];
    [request setHTTPShouldHandleCookies:FALSE];
    
    [request setHTTPMethod:@"GET"];
    
    
    
    NSHTTPURLResponse *response;
    [NSURLConnection sendSynchronousRequest:request
                          returningResponse:&response error:nil];
    
    // 处理返回的数据
    
//        NSString *strReturn = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"response is %@",response);
    
    NSString *date = [[response allHeaderFields] objectForKey:@"Date"];
    
    date = [date substringFromIndex:5];
    
    date = [date substringToIndex:[date length]-4];
    
    
    NSDateFormatter *dMatter = [[NSDateFormatter alloc] init];
    dMatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dMatter setDateFormat:@"yyyy-mm-dd HH:mm:ss"];
    
    
    
    NSDate *netDate = [[dMatter dateFromString:date] dateByAddingTimeInterval:60*60*8];
    NSLog(@"netDate = %@", netDate);
    
    
    NSDateFormatter *dMatter2 = [[NSDateFormatter alloc] init];
    dMatter2.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dMatter2 setDateFormat:@"yyyy-mm-dd HH:mm:ss"];

    NSString *currentDateString = [dMatter2 stringFromDate:netDate];
    NSLog(@"currentDateString = %@", currentDateString);
    return netDate;
    
}


@end
