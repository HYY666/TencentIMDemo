//
//  RichChatViewController.m
//  TIMChat
//
//  Created by AlexiChen on 16/3/31.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "RichChatViewController.h"
//#import "SquareDetailViewController.h"

@implementation RichChatViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //这里必须先清空会话列表
    [[[IMAPlatform sharedInstance].conversationMgr conversationList] removeAllObjects];
    [[IMAPlatform sharedInstance].conversationMgr asyncConversationList];
}


- (void)addInputPanel
{
    _inputView = [[RichChatInputPanel alloc] initRichChatInputPanel];
    _inputView.isChatRoom = self.isChatRoom;
    _inputView.chatDelegate = self;
    [self.view addSubview:_inputView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clickAvatarHandle:) name:onClickAvatarKey object:nil];
    
    IMAMsg *draftMsg = [IMAMsg msgWithDraft:[_conversation getDraft]];
    [_inputView setMsgDraft:draftMsg];
}

- (void)clickAvatarHandle:(NSNotification *)sender{
//      NSString *userId = [NSString stringWithFormat:@"%@",sender.userInfo[@"userId"]];
//    SquareDetailViewController *vc = [[SquareDetailViewController alloc]init];
//    vc.userId = userId;
//    vc.isComeChat = !self.isChatRoom;
//    [self.navigationController pushViewController:vc animated:YES];
    
}




@end
