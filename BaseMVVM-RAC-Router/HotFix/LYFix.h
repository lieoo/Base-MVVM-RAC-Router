//
//  LYFix.h
//  LYFix
//
//  Created by xly on 2018/7/25.
//  Copyright © 2018年 Xly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface LYFix : NSObject

+ (void)Fix;
+ (JSContext *)context;
+ (id)evalString:(NSString *)jsString;

+ (id)runWithClassname:(NSString *)className selector:(NSString *)selector arguments:(NSArray *)arguments;
+ (id)runWithInstance:(id)instance selector:(NSString *)selector arguments:(NSArray *)arguments;

@end
