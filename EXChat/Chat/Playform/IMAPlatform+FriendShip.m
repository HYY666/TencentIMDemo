//
//  IMAPlatform+FriendShip.m
//  TIMChat
//
//  Created by AlexiChen on 16/3/1.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "IMAPlatform+FriendShip.h"

@implementation IMAPlatform (FriendShip)



- (void)asyncSearchUserBy:(NSString *)key with:(RequestPageParamItem *)page succ:(TIMFriendSucc)succ fail:(TIMFail)fail
{
    if ([NSString isEmpty:key])
    {
        DebugLog(@"key为空");
        return;
    }
    
    NSArray *accountIDs = @[key];
    NSString *phoneId = [NSString stringWithFormat:@"86-%@", key];
    NSArray *phoneIDs = @[phoneId];
    
    
    [[TIMFriendshipManager sharedInstance] GetUsersProfile:accountIDs succ:^(NSArray *data) {
        if (succ)
        {
            succ(data);
        }
        
    } fail:^(int code, NSString *err) {
        DebugLog(@"Fail: %d->%@", code, err);
        [[TIMFriendshipManager sharedInstance] GetUsersProfile:phoneIDs succ:^(NSArray *data){
            if (succ)
            {
                succ(data);
            }
        } fail:^(int code, NSString *err) {
            DebugLog(@"Fail: %d->%@", code, err);
            [[TIMFriendshipManager sharedInstance] SearchUser:key pageIndex:page.pageIndex pageSize:page.pageSize succ:^(uint64_t totalNum, NSArray *data) {
                page.pageIndex++;
                if (data.count < page.pageSize)
                {
                    page.canLoadMore = NO;
                }
                if (succ)
                {
                    succ(data);
                }
            } fail:^(int code, NSString *err) {
                DebugLog(@"Fail: %d->%@", code, err);
                page.canLoadMore = NO;
                if (fail)
                {
                    fail(code, err);
                }
            }];
        }];
    }];
}

- (void)asyncSearchGroupBy:(NSString *)key with:(RequestPageParamItem *)page succ:(TIMGroupListSucc)succ fail:(TIMFail)fail
{
    if ([NSString isEmpty:key])
    {
        DebugLog(@"key为空");
        return;
    }
    
    NSArray *groups = @[key];
    
    __weak NSArray *wg = groups;
    
    [[TIMGroupManager sharedInstance] GetGroupPublicInfo:wg succ:^(NSArray *arr) {
        if (succ)
        {
            succ(arr);
        }
    } fail:^(int code, NSString *msg) {
        DebugLog(@"Fail: %d->%@", code, msg);
        
        [[TIMGroupManager sharedInstance] SearchGroup:key
                                                flags:TIM_GET_GROUP_BASE_INFO_FLAG_NAME | TIM_GET_GROUP_BASE_INFO_FLAG_MEMBER_NUM
                                                      | TIM_GET_GROUP_BASE_INFO_FLAG_FACE_URL | TIM_GET_GROUP_BASE_INFO_FLAG_OWNER_UIN
                                                      | TIM_GET_GROUP_BASE_INFO_FLAG_CREATE_TIME
                                               custom:nil
                                            pageIndex:(uint32_t)page.pageIndex
                                             pageSize:(uint32_t)page.pageSize
                                                 succ:^(uint64_t totalNum, NSArray *groups) {
            if (groups.count < page.pageSize)
            {
                page.canLoadMore = NO;
            }
            if (succ)
            {
                succ(groups);
            }
        } fail:^(int code, NSString *msg) {
            DebugLog(@"Fail: %d->%@", code, msg);
            page.canLoadMore = NO;
            if (fail)
            {
                fail(code, msg);
            }
        }];
    }];
}




- (void)asyncGetFirendInfo:(NSString *)userid succ:(void (^)(IMAUser *auser))succ fail:(TIMFail)fail
{
    if ([NSString isEmpty:userid])
    {
        if (succ)
        {
            succ(nil);
        }
        else
        {
            DebugLog(@"参数错误");
        }
        return;
    }
    [[TIMFriendshipManager sharedInstance] GetFriendsProfile:@[userid] succ:^(NSArray *friends) {
        for (TIMUserProfile *pro in friends)
        {
            IMAUser *user = [[IMAUser alloc] initWithUserInfo:pro];
            if (succ)
            {
                succ(user);
            }
            break;
        }
    } fail:^(int code, NSString *msg) {
        DebugLog(@"Fail: %d->%@", code, msg);
        if (fail)
        {
            fail(code, msg);
        }
    }];
}

- (void)asyncGetStrangerInfo:(NSString *)userid succ:(void (^)(IMAUser *auser))succ fail:(TIMFail)fail
{
    if ([NSString isEmpty:userid])
    {
        if (succ)
        {
            succ(nil);
        }
        else
        {
            DebugLog(@"参数错误");
        }
        return;
    }
    
    [[TIMFriendshipManager sharedInstance] GetFriendsProfile:@[userid] succ:^(NSArray *friends) {
        for (TIMUserProfile *pro in friends)
        {
            IMAUser *user = [[IMAUser alloc] initWithUserInfo:pro];
            if (succ)
            {
                succ(user);
            }
            break;
        }
    } fail:^(int code, NSString *msg) {
        DebugLog(@"Fail: %d->%@", code, msg);
        if (fail)
        {
            fail(code, msg);
        }
    }];
}



- (NSMutableArray *)filterResult:(NSArray *)array
{
    NSMutableArray *results = [NSMutableArray array];
    for (TIMFriendResult *result in array)
    {
        if (result.status == TIM_FRIEND_STATUS_SUCC)
        {
            IMAUser *user = [[IMAUser alloc] initWith:result.identifier];
            [results addObject:user];
        }
    }
    return results;
}

- (void)asyncGetSystemMessages:(RequestPageParamItem *)item last:(IMAMsg*)lastMsg succ:(TIMGetMsgSucc)succ fail:(TIMFail)fail
{
    TIMConversation* conversation = [[TIMManager sharedInstance] getConversation:TIM_SYSTEM receiver:@""];
    
    __block IMAMsg *wm = lastMsg;
    [conversation getMessage:(int)item.pageSize
                        last:(lastMsg ? lastMsg.msg : nil)
                        succ:^(NSArray *msgList) {
                            NSInteger index = 0;
                            NSMutableArray *msgs = [NSMutableArray array];
                            while (index < msgList.count)
                            {
                                TIMMessage *msg = [msgList objectAtIndex:index];
                                if (msg.isSelf)
                                {
                                    index++;
                                    continue;
                                }
                                
                                for (int i=0; i < [msg elemCount]; i++)
                                {
                                    TIMElem *elem = [msg getElem:i];
                                    if ([elem isKindOfClass:[TIMSNSSystemElem class]])
                                    {
                                        TIM_SNS_SYSTEM_TYPE type = ((TIMSNSSystemElem *)elem).type;
                                        if (type == TIM_SNS_SYSTEM_ADD_FRIEND_REQ || type == TIM_SNS_SYSTEM_ADD_FRIEND)
                                        {
                                            [msgs addObject:[IMAMsg msgWith:msg]];
                                        }
                                    }
                                    else if ([elem isKindOfClass:[TIMGroupSystemElem class]])
                                    {
                                        TIM_GROUP_SYSTEM_TYPE type = ((TIMGroupSystemElem *)elem).type;
                                        if (type == TIM_GROUP_SYSTEM_ADD_GROUP_REQUEST_TYPE)
                                        {
                                            [msgs addObject:[IMAMsg msgWith:msg]];
                                        }
                                    }
                                }
                                index++;
                            }
                            if (msgList.count > 0)
                            {
                                TIMMessage *msg = [msgList objectAtIndex:index-1];
                                wm = [IMAMsg msgWith:msg];
                            }
                            if (succ)
                            {
                                succ(msgs);
                            }
                        }
                        fail:^(int code, NSString *err) {
                            DebugLog(@"Get System Messages Failed: code=%d err=%@", code, err);
                            
                            [[HUDHelper sharedInstance] tipMessage:IMALocalizedError(code, err)];
                            if (fail)
                            {
                                fail(code, err);
                            }
                        }];
}



@end
