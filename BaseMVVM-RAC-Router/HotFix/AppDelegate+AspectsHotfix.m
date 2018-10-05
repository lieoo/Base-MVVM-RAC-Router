//
//  AppDelegate+AspectsHotfix.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/5.
//  Copyright © 2018 leios. All rights reserved.
//

#import "AppDelegate+AspectsHotfix.h"
#import "LYFix.h"

@implementation AppDelegate (AspectsHotfix)

#pragma mark -- 正式使用到 AppStore 可能会有被拒风险 请谨慎选择

+ (void)repair {
    
// 可根据请求后台返回的字符串 动态修复功能
//    [LYFix Fix];
//    NSString *jsPath = [[NSBundle mainBundle] pathForResource:@"runWithInstanceMethod" ofType:@"js"];
//    NSString *jsString = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:nil];
//    [LYFix evalString:jsString];
}

@end
