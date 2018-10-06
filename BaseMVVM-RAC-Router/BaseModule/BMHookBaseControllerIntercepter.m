//
//  BMHookBaseControllerIntercepter.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/10/5.
//  Copyright © 2018 leios. All rights reserved.
//

#import "BMHookBaseControllerIntercepter.h"
#import "Aspects.h"


@implementation BMHookBaseControllerIntercepter

+ (void)load {
    [super load];
    
    [BMHookBaseControllerIntercepter sharedInstance];
}

+ (instancetype)sharedInstance{
    static BMHookBaseControllerIntercepter *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BMHookBaseControllerIntercepter alloc]init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        /* 方法拦截 */
        
        // 拦截 viewDidLoad 方法
        [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            
            
            [self _viewDidLoad:aspectInfo.instance];
        }  error:nil];
        
        // 拦截 viewWillAppear:
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
            
            [self _viewWillAppear:animated controller:aspectInfo.instance];
        } error:NULL];
    }
    return self;
}

#pragma mark - Hook Methods
- (void)_viewDidLoad:(UIViewController <BMControllMVVMProtocol>*)controller
{
    
    if ([controller conformsToProtocol:@protocol(BMControllMVVMProtocol)]) {
        // 只有遵守 BMViewControllerProtocol 的 viewController 才进行 配置
        controller.edgesForExtendedLayout = UIRectEdgeAll;
        controller.extendedLayoutIncludesOpaqueBars = NO;
        controller.automaticallyAdjustsScrollViewInsets = NO;
        
        // 背景色设置为白色
        controller.view.backgroundColor = [UIColor whiteColor];
        
        // 执行协议方法
        
        [controller bm_initialDefaultsForController];
        [controller bm_bindViewModelForController];
        [controller bm_configNavigationForController];
        [controller bm_createViewForConctroller];
    }
}

- (void)_viewWillAppear:(BOOL)animated controller:(UIViewController <BMControllMVVMProtocol>*)controller
{
    
}


@end
