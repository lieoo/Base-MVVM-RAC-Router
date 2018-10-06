//
//  BMHomeViewController.m
//  BaseMVVM-RAC-Router
//
//  Created by Leo on 2018/9/27.
//  Copyright © 2018 leios. All rights reserved.
//

#import "BMHomeViewController.h"
#import "BMLoginViewController.h"
#import "ViewController.h"
@interface BMHomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *pushBtn;
@property (weak, nonatomic) IBOutlet UIButton *requestBtn;

@end

@implementation BMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[self.pushBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"111");

        NSString *router = [JLRoutes bm_generateURLWithPattern:BMNavPresentRoute parameters:@[NSStringFromClass(BMLoginViewController.class)]];
        
        [[RACScheduler mainThreadScheduler] schedule:^{
            [[UIApplication sharedApplication] openURL:JLRGenRouteURL(BMDefaultRouteSchema, router)];
        }];
    }];

    
    
    [[self.requestBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"222");
    }];
}

- (void)bm_initialDefaultsForController {
//    [self setViewModel:[[bmLoginViewModel alloc] initWithParams:self.params]];
    
}

- (void)bm_configNavigationForController {
    
}



- (void)bm_createViewForConctroller {
    
}

- (void)bm_bindViewModelForController {

}

@end
