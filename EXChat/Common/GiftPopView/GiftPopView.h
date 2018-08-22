//
//  GiftPopView.h
//  yeliao
//
//  Created by 趣融 on 2018/1/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GiftClickBlock)(NSInteger buttonIndex,BOOL isRecharge);

@interface GiftPopView : UIView

@property (nonatomic, copy) GiftClickBlock clickBlock;

-(instancetype)initWithDataArr:(NSArray *)dataArr clickBlock:(GiftClickBlock)clickBlock;
- (void)show;


@end
