//
//  IMAChatViewController.h
//  TIMChat
//
//  Created by AlexiChen on 16/3/17.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "ChatViewController.h"

@interface IMAChatViewController : ChatViewController <ChatInputAbleViewDelegate>
{
@protected
    ChatInputPanel *_inputView;
}

@property (nonatomic,assign) BOOL isChatRoom;

- (void)onInputViewContentHeightChanged:(NSDictionary *)change;
@end
