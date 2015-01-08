//
//  ViewController.h
//  Isa2
//
//  Created by hirotaka muranaka on 2014/11/19.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "MenuTableViewController.h"

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionViewFlowLayout *_flowLayout;
    UICollectionView *_collectionView;
}

@property (retain, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (retain, nonatomic) UICollectionView *collectionView;

- (IBAction)menuButtonTapped:(id)sender;


@end

