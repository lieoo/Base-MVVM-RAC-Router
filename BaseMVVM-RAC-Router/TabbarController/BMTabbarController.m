//
//  BMTabbarController.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/8.
//  Copyright © 2018 leios. All rights reserved.
//

#import "BMTabbarController.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

@interface BMTabbarController ()

@end

@implementation BMTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildItemsTabbar];

}
- (void)setUpChildItemsTabbar {
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"BMHomeViewController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"tab_icon_0",
                                   kSelImgKey : @"tab_icon_0_s"},
                                 
                                 @{kClassKey  : @"BMHomeViewController",
                                   kTitleKey  : @"发现",
                                   kImgKey    : @"tab_icon_1",
                                   kSelImgKey : @"tab_icon_1_s"},
                                 ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [[UIImage imageNamed:dict[kImgKey]]
                      imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]]
                              imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:RGB(101, 101, 101)} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{ NSForegroundColorAttributeName:RGB(29, 144, 214)} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    
    //去除 1px 分割线
//    self.tabBar.backgroundImage = [[UIImage alloc]init];
//    self.tabBar.shadowImage = [[UIImage alloc]init];
}

@end
