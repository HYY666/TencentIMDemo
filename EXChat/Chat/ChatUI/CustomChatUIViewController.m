//
//  CustomChatUIViewController.m
//  TIMChat
//
//  Created by wilderliao on 16/6/27.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "CustomChatUIViewController.h"
//#import "CallC2CMakeViewController.h"
//#import "GiftModel.h"
//#import "GiftPopView.h"
//#import "RechargeViewController.h"
#import "UserModel.h"


@interface CustomChatUIViewController ()
@property (nonatomic,strong)UIButton *giftButton;

@property (nonatomic,strong) UserModel *userModel;

@end

@implementation CustomChatUIViewController

//如果要使用自己的输入面板，可以重写这个函数
//- (void)addInputPanel
//{
//}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self getData];
}



- (void)getData {
//    NSString *url = [NSString stringWithFormat:@"%@%@",root,userDetail];
//    NSDictionary *dataDic = @{@"userId":[NSString stringWithFormat:@"%@",self.userId]};
//    NSMutableDictionary *parameters = [ParameterHelper getParametersWithDataDictionry:dataDic];
//    [NetworkManager postWithUrl:url params:parameters success:^(id response) {
//        if ([response[@"status"] intValue] == 0) {
//            self.userModel = [UserModel mj_objectWithKeyValues:response[@"data"]];
//        }else {
//            [HYYHudView showMsg:response[@"message"] inView:nil];
//        }
//
//    } fail:^(NSError *error) {
//
//    } showHUD:NO];
}


//添加右上角按钮
//- (void)addChatSettingItem
//{
//    //用户在这里自定义右上角按钮，不实现本函数则右上角没有按钮
//    if (![self.userId isEqualToString:[DataSource shareInstance].imKefuId] ) {//是否审核版本（0正式版本，1审核版本）
//        if ([[DataSource shareInstance].verify isEqualToString:@"0"]) {
//            UIImage *norimage =  [UIImage imageNamed:@"icon_video"];
//            UIImage *higimage =  [UIImage imageNamed:@"icon_video"];
//            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, norimage.size.width, norimage.size.height)];
//            [btn setImage:norimage forState:UIControlStateNormal];
//            [btn setImage:higimage forState:UIControlStateHighlighted];
//            [btn addTarget:self action:@selector(onClickChatSetting) forControlEvents:UIControlEventTouchUpInside];
//            UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithCustomView:btn];
//            self.navigationItem.rightBarButtonItem = bar;
//        }
//
//
//        _giftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_giftButton setImage:[UIImage imageNamed:@"video_btn_gift"] forState:UIControlStateNormal];
//        _giftButton.frame = CGRectMake(SCREEN_WIDTH-55, SCREEN_HEIGHT - 170, 50, 50);
//        [self.view addSubview:_giftButton];
//        [_giftButton addTarget:self action:@selector(giftButtonClicked) forControlEvents:UIControlEventTouchUpInside];
//    }
//
//}
//
//
//- (void)onInputViewContentHeightChanged:(NSDictionary *)change {
//    [super onInputViewContentHeightChanged:change];
//    NSInteger nv = [change[NSKeyValueChangeNewKey] integerValue]-h375(50);
//    _giftButton.frame = CGRectMake(SCREEN_WIDTH-55, SCREEN_HEIGHT - 170-nv, 50, 50);
//}
//
//
//- (void)giftButtonClicked{
//    self.giftButton.enabled = NO;
//    NSString *url = [NSString stringWithFormat:@"%@%@",root,giftList];
//    NSDictionary *dataDic = @{};
//    NSMutableDictionary *parameters = [ParameterHelper getParametersWithDataDictionry:dataDic];
//    [NetworkManager postWithUrl:url params:parameters success:^(id response) {
//        self.giftButton.enabled = YES;
//        if (response[@"status"]&&[response[@"status"] intValue] == 0) {
//             NSArray *arr = [GiftModel mj_objectArrayWithKeyValuesArray:response[@"data"][@"giftList"]];
//            GiftPopView *giftPopView = [[GiftPopView alloc]initWithDataArr:arr clickBlock:^(NSInteger buttonIndex, BOOL isRecharge) {
//                if (isRecharge) {//跳充值
//                    [self.navigationController pushViewController:[RechargeViewController new] animated:YES];
//                }else{
//                    NSString *giftUrl = [NSString stringWithFormat:@"%@%@",root,userGift];
//                    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc]init];
//                    [dataDic setValue:[UserHelper sharedHelper].user.userId?[UserHelper sharedHelper].user.userId:@"" forKey:@"userId"];
//                    [dataDic setValue:self.userId?self.userId:@"" forKey:@"toUserId"];
//                   GiftModel *model = arr[buttonIndex];
//                    [dataDic setValue:model.giftId?model.giftId:@"" forKey:@"giftId"];
//                    [dataDic setValue:@1 forKey:@"number"];
//                    [dataDic setValue:@2 forKey:@"type"];//赠送类型：1视频赠送，2私聊赠送
//                    NSMutableDictionary *parameters = [ParameterHelper getParametersWithDataDictionry:dataDic];
//                    [NetworkManager postWithUrl:giftUrl params:parameters success:^(id response) {
//                        [HYYHudView showMsg:response[@"message"] inView:nil];
//                        if (response[@"status"]&&[response[@"status"] intValue] == 0) {
//
//                            [self sendOnLineTIMMessageWithText:[NSString stringWithFormat:@"送出[%@]",model.giftName?model.giftName:@"礼物"] giftModel:model];
//                            [[DataSource shareInstance]getUserInfo:nil];
//
//                        }
//                    } fail:^(NSError *error) {
//                          self.giftButton.enabled = YES;
//                        [HYYHudView showMsg:@"发送礼物失败，请检查网络." inView:nil];
//                    } showHUD:NO];
//                }
//            }];
//            [self.view endEditing:YES];
//            [giftPopView show];
//        }
//
//    } fail:^(NSError *error) {
//        [HYYHudView showMsg:@"获取礼物列表失败，请检查网络." inView:nil];
//    } showHUD:NO];
//
//
//}

//送礼物
//- (void)sendOnLineTIMMessageWithText:(NSString *)text  giftModel:(GiftModel *)model{
//    TIMMessage *msg = [[TIMMessage alloc]init];
//    TIMTextElem *textElem = [[TIMTextElem alloc]init];
//    textElem.text = text?text:@"";
//    [msg addElem:textElem];
//
//    NSString *dicStr;
//    NSDictionary *paramDic = @{@"giftId":model.giftId?model.giftId:@"",
//                                @"giftName":model.giftName?model.giftName:@"",
//                                @"giftImage":model.giftImage?model.giftImage:@""
//                                   };
//    dicStr = [NSString dictionaryToJson:paramDic];
//
//    NSMutableDictionary *dic = [ParameterHelper getCustomDataWithToNick:self.nickName toHeadUrl:self.headUrl type:@"2" param:dicStr];
//
//    TIMCustomElem *elem = [[TIMCustomElem alloc] init];
//    elem.data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];;
//    [msg addElem:elem];
//
//    IMAMsg *iMsg = [IMAMsg msgWith:msg];
//    IMAUser *user = [[IMAUser alloc]initWith:self.userId];
//    IMAConversation *con = [[IMAPlatform sharedInstance].conversationMgr chatWith:user];
//    [con sendMessage:iMsg completion:^(NSArray *imamsgList, BOOL succ, int code) {
//        NSDictionary *dic = @{@"userId":self.userId,@"msg":imamsgList};
//        [[NSNotificationCenter defaultCenter]postNotificationName:sendGiftMessage object:nil userInfo:dic];
//    }];
    
//}



//右上角按钮
- (void)onClickChatSetting
{
  
//    if ([[UserHelper sharedHelper].user.userId isEqualToString:self.userId]) {//
//        [HYYHudView showMsg:@"不能对自己进行操作" inView:nil];
//        return;
//    }
//    if (!self.userModel) {
//        [HYYHudView showMsg:@"对方资料未获取成功" inView:nil];
//        return;
//    }
//
//    if ([[UserHelper sharedHelper].user.userGold intValue] < [self.userModel.userChargeSet intValue]) {//钱不够了
//        [EMAlertView showAlertWithTitle:@"温馨提示" message:@"叶子余额不足，请先充值" completionBlock:^(NSUInteger buttonIndex, EMAlertView *alertView) {
//            if (buttonIndex == 1) {//充值
//                [self.navigationController pushViewController:[RechargeViewController new] animated:YES];
//            }
//        } cancelButtonTitle:@"取消" otherButtonTitles:@"充值"];
//        return;
//    }
//
//    CallC2CMakeViewController *make = [[CallC2CMakeViewController alloc]init];
//    make.peerId =  [NSString stringWithFormat:@"%@",self.userId] ;
//    make.nickName = self.nickName;
//    make.headUrl = self.headUrl;
////    [self presentViewController:make animated:YES completion:nil];
//    [self.navigationController pushViewController:make animated:NO];
}
@end
