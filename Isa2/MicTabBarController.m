//
//  MicTabBarController.m
//  Isa2
//
//  Created by hirotaka muranaka on 2014/11/19.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import "MicTabBarController.h"

@interface MicTabBarController ()

@end

@implementation MicTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRaisedCenterButton];
    
    // loding作成
    _progress = [[MBProgressHUD alloc] initWithView:self.view];
    _progress.labelText = @"音声情報取得中";
    [self.view addSubview:_progress];
    _progress.dimBackground = YES;
    _progress.delegate = self;
    
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

- (void)createRaisedCenterButton {
    UIImage *buttonImage = [UIImage imageNamed:@"mic"];
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0) {
        button.center = self.tabBar.center;
    } else {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [button addTarget:self action:@selector(micButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)micButtonTapped:(id)sender
{
    // loding表示
    [_progress show:YES];
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(finishEvent:) userInfo:nil repeats:NO];
    
    
//    UINavigationController *navigationController = [self.viewControllers objectAtIndex:0];
//    ViewController *viewController = [navigationController.viewControllers objectAtIndex:0];
//    [viewController performSegueWithIdentifier:@"pushSegue" sender:self];
}

// 3秒後に呼び出されるメソッド
- (void)finishEvent:(NSTimer *)timer
{
    [_progress hide:YES];
}

// MBProgressHUDが非表示になった後に呼びだされるデリゲートメソッド
- (void)hudWasHidden:(MBProgressHUD *)hud
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"音声認識完了"
                          message: @"詳細情報を確認してポイントを獲得しよう。"
                          delegate:self
                          cancelButtonTitle: @"キャンセル"
                          otherButtonTitles:@"ポイントを獲得", nil];
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
//            NSLog(@"cancel button pushed");
            break;
        case 1:
        {
            UINavigationController *nc = (UINavigationController *)self.selectedViewController;
//            [nc popToRootViewControllerAnimated:NO];
            ViewController *vc = [nc.viewControllers objectAtIndex:0];
            [vc performSegueWithIdentifier:@"toPointSegue" sender:self];
            break;
        }
    }
}

@end
