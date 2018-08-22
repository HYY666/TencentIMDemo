//
//  GiftButton.h
//  yeliao
//
//  Created by 趣融 on 2018/1/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface GiftButton : UIButton
@property (nonatomic,assign)BOOL isHidden;
- (void)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(NSString *)imageStr;

@end
