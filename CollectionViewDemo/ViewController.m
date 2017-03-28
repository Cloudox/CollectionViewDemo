//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by csdc-iMac on 2017/3/28.
//  Copyright © 2017年 Cloudox. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

// 设备的宽高
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // cell的布局方式，默认流水布局（UICollectionViewFlowLayout）
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置滚动方式为水平，默认是垂直滚动
//    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    // 初始化UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1];
    // 注册cell，此处的Identifier和DataSource方法中的Identifier保持一致，cell只能通过注册来确定重用标识符
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
}

#pragma mark - UICollectionView DataSource
// section数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// section内行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

// 每个cell的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(SCREENWIDTH/2 - 2, SCREENWIDTH/2 - 2);
}

// 垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 4;
}

// 水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}

// cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionView Delegate 
// 点击cell响应
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"%@", cell.label.text);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
