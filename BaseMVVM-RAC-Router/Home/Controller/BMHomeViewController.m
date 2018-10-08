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
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@end

@implementation BMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    NSLog(@"参数:%@",self.params);
    
    if (self.params) {
        NSInteger index = [self.params[@"count"] integerValue] + 1;
        self.numLabel.text = [NSString stringWithFormat:@"%ld",index];
    }
    
    [[self.pushBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {

        NSString *router = [JLRoutes bm_generateURLWithPattern:BMNavPushRoute parameters:@[NSStringFromClass(BMHomeViewController.class)] extraParameters:@{@"count":self.numLabel.text}];
        
        [[RACScheduler mainThreadScheduler] schedule:^{
            [[UIApplication sharedApplication] openURL:JLRGenRouteURL(BMDefaultRouteSchema, router)];
        }];
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
