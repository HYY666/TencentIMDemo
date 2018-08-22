//
//  ConversationListViewController.m
//  TIMChat
//
//  Created by wilderliao on 16/2/16.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "ConversationListViewController.h"

#import "ConversationListTableViewCell.h"

#import "CustomChatUIViewController.h"
//#import "CustomMessageCell.h"
//#import "VideoCallHistoryViewController.h"

@interface ConversationListViewController ()

@property (nonatomic,strong) NSMutableArray *customDataArr;

@end

@implementation ConversationListViewController



- (void)addHeaderView
{
    
}
- (void)addFooterView
{
    
}

- (BOOL)hasData
{
    BOOL has = _conversationList.count != 0;
    return has;
}


- (void)addRefreshScrollView
{
    _tableView = [[SwipeDeleteTableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = kClearColor;
    _tableView.scrollsToTop = YES;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kWTabbarHeight)];
//    v.backgroundColor = kClearColor;
    [_tableView setTableFooterView:v];
    self.refreshScrollView = _tableView;
    
   
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[DataSource shareInstance].verify isEqualToString:@"0"]) {//是否审核版本（0正式版本，1审核版本）
    self.customDataArr = @[].mutableCopy;
    MenuItem *item1 = [[MenuItem alloc]initWithTitle:@"视频通话记录" icon:[UIImage imageNamed:@"icon_call"] action:nil];
//    MenuItem *item2 = [[MenuItem alloc]initWithTitle:@"客服MM" icon:[UIImage imageNamed:@"icon_mi"] action:nil];
    [self.customDataArr addObject:item1];
        //    [self.customDataArr addObject:item2];
    }

//    [self.tableView registerClass:[CustomMessageCell class] forCellReuseIdentifier:@"CustomMessageCell"];
 
    [self pinHeaderView];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[IMAPlatform sharedInstance].conversationMgr releaseChattingConversation];
}

- (void)addSearchController
{
}

- (void)configOwnViews
{
    IMAConversationManager *mgr = [IMAPlatform sharedInstance].conversationMgr;
    _conversationList = [mgr conversationList];
    __weak ConversationListViewController *ws = self;
    mgr.conversationChangedCompletion = ^(IMAConversationChangedNotifyItem *item) {
        [ws onConversationChanged:item];
    };

    self.KVOController = [FBKVOController controllerWithObserver:self];
    [self.KVOController observe:[IMAPlatform sharedInstance].conversationMgr keyPath:@"unReadMessageCount" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        [ws onUnReadMessag];
    }];
    [ws onUnReadMessag];
}

- (void)onUnReadMessag
{
    NSInteger unRead = [IMAPlatform sharedInstance].conversationMgr.unReadMessageCount;
    NSString *badge = nil;
    if (unRead > 0 && unRead <= 99)
    {
        badge = [NSString stringWithFormat:@"%d", (int)unRead];
    }
    else if (unRead > 99)
    {
        badge = @"99+";
    }
    self.navigationController.tabBarItem.badgeValue = badge;
}


- (void)onConversationChanged:(IMAConversationChangedNotifyItem *)item
{
    switch (item.type)
    {
        case EIMAConversation_SyncLocalConversation:
        {
            [self reloadData];
        }
            
            break;
        case EIMAConversation_BecomeActiveTop:
        {
            [self.tableView beginUpdates];
            [self.tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:item.index inSection:1] toIndexPath:[NSIndexPath indexPathForRow:item.toIndex inSection:1]];
            [self.tableView endUpdates];
        }
            break;
        case EIMAConversation_NewConversation:
        {
            [self.tableView beginUpdates];
            NSIndexPath *index = [NSIndexPath indexPathForRow:item.index inSection:1];
            [self.tableView insertRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView endUpdates];
        }
            break;
        case EIMAConversation_DeleteConversation:
        {
            [self.tableView beginUpdates];
            NSIndexPath *index = [NSIndexPath indexPathForRow:item.index inSection:1];
            [self.tableView deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView endUpdates];
        }
            break;
        case EIMAConversation_Connected:
        {
            [self.tableView beginUpdates];
            NSIndexPath *index = [NSIndexPath indexPathForRow:item.index inSection:1];
            [self.tableView deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView endUpdates];
        }
            break;
        case EIMAConversation_DisConnected:
        {
            [self.tableView beginUpdates];
            NSIndexPath *index = [NSIndexPath indexPathForRow:item.index inSection:1];
            [self.tableView insertRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView endUpdates];
        }
            break;
        case EIMAConversation_ConversationChanged:
        {
            [self.tableView beginUpdates];
            NSIndexPath *index = [NSIndexPath indexPathForRow:item.index inSection:1];
            [self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
            
            [self.tableView endUpdates];
        }
            break;
        default:
            
            break;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.customDataArr.count;
    }
    return [_conversationList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 0) {
//        CustomMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomMessageCell" forIndexPath:indexPath];
//        cell.item = self.customDataArr[indexPath.row];
//        return cell;
//    }
    id<IMAConversationShowAble> conv = [_conversationList objectAtIndex:indexPath.row];
    NSString *reuseidentifier = [conv showReuseIndentifier];
    [conv attributedDraft];
    id<IMAConversationShowAble> tempCon = [[[IMAPlatform sharedInstance].conversationMgr conversationList] objectAtIndex:indexPath.row];
    [tempCon attributedDraft];
    
    ConversationListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseidentifier];
    if (!cell)
    {
        cell = [[[conv showCellClass] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseidentifier];
    }
    [cell configCellWith:conv];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return YES;
    }
    return NO;
}




- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        IMAConversation *conv = [_conversationList objectAtIndex:indexPath.row];
        [[IMAPlatform sharedInstance].conversationMgr deleteConversation:conv needUIRefresh:YES];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {//视频通话记录
//            [HYYHudView showMsg:@"暂未开放" inView:nil];
//            VideoCallHistoryViewController *vc = [[VideoCallHistoryViewController alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
        }
        return;
    }
    id<IMAConversationShowAble> convable = [_conversationList objectAtIndex:indexPath.row];
    IMAConversation *conv = (IMAConversation *)convable;
    
    switch ([convable conversationType])
    {
        case IMA_C2C:
        case IMA_Group:
        {
                if ([conv type] == TIM_C2C)
                {
                 IMAUser *auser =  [[IMAUser alloc]initWith:[conv receiver]];
                 CustomChatUIViewController*chat = [[CustomChatUIViewController alloc]initWith:auser];
                    chat.userId = [conv receiver];
                 chat.nickName = conv.nickName;
                 chat.headUrl = conv.headUrl;
                 [self.navigationController pushViewController:chat animated:YES];
                 [conv setReadAllMsg];
                 ConversationListTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                 [cell refreshCell];
                        
                }
                else if ([conv type] == TIM_GROUP)
                {
                    // 有可能是因为退群本地信息信息未同步
                    [[IMAPlatform sharedInstance].conversationMgr deleteConversation:conv needUIRefresh:YES];
                }
                
            }
            break;
            
        case IMA_Connect:
            
            
            
        default:
            break;
    }
    
}


@end
