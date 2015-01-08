//
//  MicTabBarController.h
//  Isa2
//
//  Created by hirotaka muranaka on 2014/11/19.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "ViewController.h"

@interface MicTabBarController : UITabBarController <MBProgressHUDDelegate>
{
    MBProgressHUD *_progress;
}

@end
