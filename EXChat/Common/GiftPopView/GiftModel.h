//
//  GiftModel.h
//  yeliao
//
//  Created by 趣融 on 2018/1/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GiftModel : NSObject

@property (nonatomic,strong) NSString *giftId;

@property (nonatomic,strong) NSString *giftName;

@property (nonatomic,strong) NSString *giftGold;

@property (nonatomic,strong) NSString *giftImage;


@property (nonatomic,strong) NSString *headImage; // 头像

@property (nonatomic,copy) NSString *name; // 送礼物者

@property (nonatomic,assign) NSInteger giftCount; // 礼物个数



@end
