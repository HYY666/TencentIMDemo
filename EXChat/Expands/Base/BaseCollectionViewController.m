//
//  BaseCollectionVC.m
//  jschat
//
//  Created by liuyanqing on 2017/12/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseCollectionViewController.h"
#import "BaseCollectionViewCell.h"
@interface BaseCollectionViewController ()

@end

@implementation BaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = generalBGColour;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.alwaysBounceVertical = YES;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[BaseCollectionViewCell class] forCellWithReuseIdentifier:@"BaseCollectionViewCell"];
    _collectionView.showsVerticalScrollIndicator = NO;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BaseCollectionViewCell" forIndexPath:indexPath];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = [[NSString stringWithFormat:@"%f",(SCREEN_WIDTH-40)/3] intValue];
    return CGSizeMake(width, width);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
