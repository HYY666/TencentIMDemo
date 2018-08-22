//
//  IMAConversation.h
//  TIMAdapter
//
//  Created by AlexiChen on 16/1/29.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

@class IMAUser;
@class IMAMsg;


typedef NS_ENUM(NSInteger, IMAConType)
{
    IMA_Unknow,                     // 未知
    IMA_C2C = TIM_C2C,              // C2C类型
    IMA_Group = TIM_GROUP,          // 群聊类型
    IMA_System = TIM_SYSTEM,        // 系统消息
    // 定制会话类型
    IMA_Connect,                    // 网络联接
    
    //    kSupportCustomConversation 为 1时有效
    IMA_Sys_NewFriend,              // 新朋友系统消息
    IMA_Sys_GroupTip,               // 群系统消息通知
    
};

typedef void (^HandleMsgBlock)(NSArray *imamsgList, BOOL succ);
typedef void (^HandleMsgCodeBlock)(NSArray *imamsgList, BOOL succ, int code);
typedef void (^RemoveMsgBlock)(NSArray *imamsgList, BOOL succ, CommonVoidBlock removeingAction);

@interface IMAConversation : NSObject
{
@protected
    TIMConversation     *_conversation;
    CLSafeMutableArray  *_msgList;
    IMAMsg              *_lastMessage;
    IMAConType          _imaConType;
    
}

@property (nonatomic, strong) IMAMsg   *lastMessage;
@property (nonatomic, readonly) CLSafeMutableArray *msgList;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,strong) NSString *headUrl;


@property (nonatomic, copy) HandleMsgBlock receiveMsg;

- (instancetype)initWith:(TIMConversation *)conv;

- (void)copyConversationInfo:(IMAConversation *)conv;

// 主要用于启动的时候加载本地数据
- (void)asyncLoadLocalLastMsg:(CommonVoidBlock)block;

// 用于切换聊天对象时，释放上次聊天的对象的数据主要是_msgList
- (void)releaseConversation;

// 切换到本会话前，先加载本地的最后count条聊天的的数据
- (void)asyncLoadRecentMessage:(NSInteger)count completion:(HandleMsgBlock)block;

// 用于顶部下拉加载更多历史消息
- (void)asyncLoadRecentMessage:(NSInteger)count from:(IMAMsg *)msg completion:(HandleMsgBlock)block;

- (TIMConversationType)type;

- (NSString *)receiver;

- (BOOL)isChatWith:(IMAUser *)user;

- (NSArray *)sendMessage:(IMAMsg *)msg completion:(HandleMsgCodeBlock)block;

- (void)sendOnlineMessage:(TIMMessage*)msg succ:(TIMSucc)succ fail:(TIMFail)fail;

- (NSArray *)appendWillSendMsg:(IMAMsg *)msg completion:(HandleMsgBlock)block;
- (void)replaceWillSendMsg:(IMAMsg *)msg with:(IMAMsg *)newMsg completion:(HandleMsgBlock)block;
- (NSArray *)removeMsg:(IMAMsg *)msg completion:(RemoveMsgBlock)block;

- (void)setReadAllMsg;


- (IMAConType)imaType;

- (NSInteger)unReadCount;

- (void)setDraft:(TIMMessageDraft *)msgDraft;

- (TIMMessageDraft *)getDraft;

//===========================
// Protected方法
- (void)onReceiveNewMessage:(IMAMsg *)msg;

@end
