//
//  LandingViewController.m
//  Isa2
//
//  Created by hirotaka muranaka on 2014/11/22.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import "LandingViewController.h"

@interface LandingViewController ()

@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"1,000ポイント保有";
    
    NSString* urlString = @"https://point.recruit.co.jp/";
    NSURL* url = [NSURL URLWithString: urlString];
    NSURLRequest* myRequest = [NSURLRequest requestWithURL: url];
    [self.webview loadRequest:myRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
