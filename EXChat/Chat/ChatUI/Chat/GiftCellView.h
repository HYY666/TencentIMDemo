//
//  GiftCellView.h
//  yeliao
//
//  Created by 趣融 on 2018/3/20.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GiftModel.h"

@interface GiftCellView : UIView


@property (nonatomic,assign) BOOL *isMine;

@property (nonatomic,strong) NSDictionary *dataDic;

@end
