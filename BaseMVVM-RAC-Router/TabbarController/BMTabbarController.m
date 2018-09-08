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
                                 @{kClassKey  : @"VYBGameCenterViewController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"",
                                   kSelImgKey : @""}
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
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    
    //去除 1px 分割线
    self.tabBar.backgroundImage = [[UIImage alloc]init];
    self.tabBar.shadowImage = [[UIImage alloc]init];
}

@end
