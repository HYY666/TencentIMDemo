//
//  ChatBaseTableViewCell.m
//  TIMChat
//
//  Created by AlexiChen on 16/3/1.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "ChatBaseTableViewCell.h"


@interface MenuButton (TIMElemPickedAbleView)

@end

@implementation MenuButton (TIMElemPickedAbleView)

@end

@implementation ChatBaseTableViewCell

// 只创建，外部统一添加
- (UIView<TIMElemSendingAbleView> *)addSendingTips
{
    MsgSendingTip *tip = [[MsgSendingTip alloc] init];
    return tip;
}

// 只创建，外部统一添加
- (UIView<TIMElemPickedAbleView> *)addPickedView
{
    MenuButton *btn = [[MenuButton alloc] init];
    [btn addTarget:self action:@selector(onPicked:) forControlEvents:UIControlEventTouchUpInside];
    return (UIView<TIMElemPickedAbleView> *)btn;
}

- (void)onPicked:(MenuButton *)btn
{
    btn.selected = !btn.selected;
    _msg.isPicked = btn.selected;
}



- (void)configContent
{
    UIEdgeInsets inset = [_msg contentBackInset];
    if ([_msg isMineMsg])
    {
        _contentBack.image = [[UIImage imageWithColor:COLOR_CHAT_BACK_ME] resizableImageWithCapInsets:inset];
    }
    else
    {
        _contentBack.image = [[UIImage imageWithColor:COLOR_CHAT_BACK] resizableImageWithCapInsets:inset];
    }
    _contentBack.layer.cornerRadius = CHAT_BACK_RADIUS;
    _contentBack.clipsToBounds = YES;
}


- (void)configSendingTips
{
    [super configSendingTips];
    IMAMsgStatus state = [_msg status];
    [_sendingTipRef setMsgStatus:state];
}

- (void)addC2CCellViews
{
    [super addC2CCellViews];
    [_icon addTarget:self action:@selector(onClickUserIcon) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClickUserIcon
{
    if (![_msg isMineMsg])
    {
      IMAUser *user =  [_msg getSender];

            NSDictionary *dic = @{@"userId":[NSString stringWithFormat:@"%@",user.userId]};
            [[NSNotificationCenter defaultCenter]postNotificationName:onClickAvatarKey object:nil userInfo:dic];
        
        
    }
    

}
@end
