//
//  BaseCollectionViewController.h
//  jschat
//
//  Created by liuyanqing on 2017/12/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseCollectionViewController : BaseViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView *collectionView;

@end
