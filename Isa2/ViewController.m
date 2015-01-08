//
//  ViewController.m
//  Isa2
//
//  Created by hirotaka muranaka on 2014/11/19.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize collectionView = _containerView;
@synthesize flowLayout = _flowLayout;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // シャドウ
    self.view.layer.shadowOpacity = 0.5f;
    self.view.layer.shadowRadius = 5.0f;
    self.view.layer.shadowColor = [UIColor grayColor].CGColor;
    
    // ECSlidingViewControllerのunderLeftViewControllerにMenuTableViewControllerを指定する
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuTableViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    [self.slidingViewController setAnchorRightRevealAmount:130.0f];
    
    [self createCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createCollectionView
{
    UIImage *image = [UIImage imageNamed:@"tvp-1"];
    float ratio = (self.view.frame.size.width/2) / image.size.width;
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(self.view.frame.size.width/2, image.size.height*ratio);
    self.flowLayout.minimumLineSpacing = 0.0f;
    self.flowLayout.minimumInteritemSpacing = 0.0f;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:self.flowLayout];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.scrollEnabled = YES;
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.pagingEnabled = YES;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    NSString *baseStr = @"tvp-";
    NSString *formatStr = [baseStr stringByAppendingFormat:@"%ld", indexPath.row + 1];
    
    UIImage *image = [UIImage imageNamed:formatStr];
    float ratio = (self.view.frame.size.width/2) / image.size.width;
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width/2, image.size.height*ratio)];
    [imageView setImage:image];
    
    [cell.contentView addSubview:imageView];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // for tap
}

- (IBAction)menuButtonTapped:(id)sender {
    
    if (self.slidingViewController.currentTopViewPosition == ECSlidingViewControllerTopViewPositionCentered) {
        [self.slidingViewController anchorTopViewToRightAnimated:YES];
    } else {
        [self.slidingViewController resetTopViewAnimated:YES];
    }

}
@end
