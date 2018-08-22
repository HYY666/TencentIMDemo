//
//  IMAPlatform+Login.h
//  TIMChat
//
//  Created by AlexiChen on 16/2/26.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "IMAPlatform.h"

@interface IMAPlatform (Login)



// 配置进入主界面后的要拉取的数据
- (void)configOnLoginSucc:(TIMLoginParam *)param;

@end
