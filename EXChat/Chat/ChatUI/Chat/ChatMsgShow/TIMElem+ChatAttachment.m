//
//  TIMElem+ChatTextAttachment.m
//  TIMChat
//
//  Created by AlexiChen on 16/3/31.
//  Copyright © 2016年 AlexiChen. All rights reserved.
//

#import "TIMElem+ChatAttachment.h"

@implementation TIMElem (ChatAttachment)

- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
    return nil;
}
- (NSArray *)inputAttachmentOf:(IMAMsg *)msg
{
    return nil;
}
- (NSArray *)chatAttachmentOf:(IMAMsg *)msg
{
    return nil;
}

@end


@implementation TIMTextElem (ChatAttachment)

- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text attributes:@{NSFontAttributeName : [msg tipFont], NSForegroundColorAttributeName : [msg tipTextColor]}];
    return @[str];
}
- (NSArray *)inputAttachmentOf:(IMAMsg *)msg
{
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:self.text attributes:@{NSFontAttributeName : [msg inputTextFont], NSForegroundColorAttributeName : [msg inputTextColor]}];
    return @[str];
}
- (NSArray *)chatAttachmentOf:(IMAMsg *)msg
{
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    
    paragraphStyle.lineSpacing = 2;// 字体的行间距
    paragraphStyle.minimumLineHeight =21;
//    paragraphStyle.paragraphSpacing = 5;
//    paragraphStyle.paragraphSpacingBefore = 10;
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:self.text attributes:@{NSFontAttributeName : [msg textFont], NSForegroundColorAttributeName : [msg textColor],NSParagraphStyleAttributeName:paragraphStyle}];
    return @[str];
}

@end


@implementation TIMImageElem (ChatAttachment)

- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"[图片]" attributes:@{NSFontAttributeName : [msg tipFont], NSForegroundColorAttributeName : [msg tipTextColor]}];
    return @[str];
}
- (NSArray *)inputAttachmentOf:(IMAMsg *)msg
{
    // 不能在输入框里面直接添加非表情图片
    return nil;
}
- (NSArray *)chatAttachmentOf:(IMAMsg *)msg
{
    ChatImageAttachment *imageAt = [[ChatImageAttachment alloc] initWith:self];
    
    __weak TIMImageElem *elem = self;
    [self asyncThumbImage:^(NSString *path, UIImage *image, BOOL succ, BOOL isAsync) {
        // TODO，添加占位图
        if (succ)
        {
            imageAt.image = image;
        }
        else
        {
            imageAt.image = [UIImage imageNamed:@"delete_big"];
        }
        
        if (isAsync)
        {
            // 更新msg的显示
            [msg updateElem:elem attachmentChanged:imageAt];
        }
    } inMsg:msg];
    
    NSInteger tw = [msg integerForKey:kIMAMSG_Image_ThumbWidth];
    NSInteger th = [msg integerForKey:kIMAMSG_Image_ThumbHeight];
    imageAt.bounds = CGRectMake(0, 0, tw, th);
    
    NSAttributedString *imagAtt = [NSAttributedString attributedStringWithAttachment:imageAt];
    return @[imagAtt];
}


@end


@implementation TIMFaceElem (ChatAttachment)

- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
//    UIFont *tipFont = [msg tipFont];
    NSInteger height = 20;
    
    ChatImageAttachment *image = [[ChatImageAttachment alloc] initWith:self];
    ChatSystemFaceItem *item = [[ChatSystemFaceHelper sharedHelper] emojiItemOf:self.index];
    // TODO：待取到表情表之后再作处理
    image.tag = item.emojiTag;
    image.image = [item inputGif];
    
    image.bounds = CGRectMake(0, 0, height, height);
    NSAttributedString *imagAtt = [NSAttributedString attributedStringWithAttachment:image];
    return @[imagAtt];
}
- (NSArray *)inputAttachmentOf:(IMAMsg *)msg
{
    //    UIFont *inputFont = [msg inputTextFont];
    NSInteger height = 20;
    
    // TODO：待取到表情表之后再作处理
    ChatImageAttachment *image = [[ChatImageAttachment alloc] initWith:self];
    ChatSystemFaceItem *item = [[ChatSystemFaceHelper sharedHelper] emojiItemOf:self.index];
    image.tag = item.emojiTag;
    image.image = [item inputGif];
    
    image.bounds = CGRectMake(0, 0, height, height);
    
    NSAttributedString *imagAtt = [NSAttributedString attributedStringWithAttachment:image];
    return @[imagAtt];
}
- (NSArray *)chatAttachmentOf:(IMAMsg *)msg
{
    
    NSInteger height = 20;
    ChatImageAttachment *image = [[ChatImageAttachment alloc] initWith:self];
    ChatSystemFaceItem *item = [[ChatSystemFaceHelper sharedHelper] emojiItemOf:self.index];
    image.tag = item.emojiTag;
    image.image = [item inputGif];
    image.bounds = CGRectMake(0, 0, height + 2, height);
    NSAttributedString *imagAtt = [NSAttributedString attributedStringWithAttachment:image];
    return @[imagAtt];
}

@end

@implementation TIMFileElem (ChatAttachment)

- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"[文件]" attributes:@{NSFontAttributeName : [msg tipFont], NSForegroundColorAttributeName : [msg tipTextColor]}];
    return @[str];
}

@end

@implementation TIMSoundElem (ChatAttachment)

- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"[语音]" attributes:@{NSFontAttributeName : [msg tipFont], NSForegroundColorAttributeName : [msg tipTextColor]}];
    return @[str];
}

@end

@implementation TIMLocationElem (ChatAttachment)

- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"[位置]" attributes:@{NSFontAttributeName : [msg tipFont], NSForegroundColorAttributeName : [msg tipTextColor]}];
    return @[str];
}

@end

@implementation TIMVideoElem (ChatAttachment)

- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"[视频]" attributes:@{NSFontAttributeName : [msg tipFont], NSForegroundColorAttributeName : [msg tipTextColor]}];
    return @[str];
}
@end

@implementation TIMGroupTipsElem (ChatAttachment)

- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[self tipText] attributes:@{NSFontAttributeName : [msg tipFont], NSForegroundColorAttributeName : [msg tipTextColor]}];
    return @[str];
}

@end


@implementation TIMGroupSystemElem (ChatAttachment)


- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[self showDescriptionOf:msg] attributes:@{NSFontAttributeName : [msg tipFont], NSForegroundColorAttributeName : [msg tipTextColor]}];
    return @[str];
}
@end

@implementation TIMSNSSystemElem (ChatAttachment)
- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[self showDescriptionOf:msg] attributes:@{NSFontAttributeName : [msg tipFont], NSForegroundColorAttributeName : [msg tipTextColor]}];
    return @[str];
}
@end

@implementation TIMProfileSystemElem (ChatAttachment)

- (NSArray *)singleAttachmentOf:(IMAMsg *)msg
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"资料变更消息" attributes:@{NSFontAttributeName : [msg tipFont], NSForegroundColorAttributeName : [msg tipTextColor]}];
    return @[str];
}
@end




