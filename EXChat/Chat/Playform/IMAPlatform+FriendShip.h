//
//  IMAPlatform+FriendShip.h
//  TIMChat
//
//  Created by AlexiChen on 16/3/1.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "IMAPlatform.h"

// 关系链相关的操作

@interface IMAPlatform (FriendShip)

/**
 *  获取用户资料
 *
 *  @param users 要获取的用户列表 NSString* 列表
 *  @param succ  成功回调，返回 IMAUser* 列表
 *  @param fail  失败回调
 *
 *  @return 0 发送请求成功
 */
- (void)asyncSearchUserBy:(NSString *)key with:(RequestPageParamItem *)page succ:(TIMFriendSucc)succ fail:(TIMFail)fail;



- (void)asyncGetFirendInfo:(NSString *)userid succ:(void (^)(IMAUser *auser))succ fail:(TIMFail)fail;
- (void)asyncGetStrangerInfo:(NSString *)userid succ:(void (^)(IMAUser *auser))succ fail:(TIMFail)fail;



- (void)asyncGetSystemMessages:(RequestPageParamItem *)item last:(IMAMsg*)lastMsg succ:(TIMGetMsgSucc)succ fail:(TIMFail)fail;



@end
