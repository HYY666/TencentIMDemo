//
//  GiftChatTableViewCell.m
//  yeliao
//
//  Created by Apple on 2018/3/24.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GiftChatTableViewCell.h"
#import "GiftModel.h"
#import "GiftCellView.h"


@interface GiftChatTableViewCell ()

@property (nonatomic,strong) GiftCellView *giftView;


@end



@implementation GiftChatTableViewCell


- (void)prepareForReuse
{
    [super prepareForReuse];
    [_msg prepareChatForReuse];
}


// 只创建，外部统一添加
- (UIView *)addElemContent
{
    self.giftView = [[GiftCellView alloc]init];
    self.giftView.backgroundColor = [UIColor clearColor];
    return self.giftView;
}

- (void)configContent
{
    [super configContent];
        if (self.param) {
            NSDictionary *pramDic = [NSDictionary stringToNSDictionary:self.param];
            self.giftView.dataDic = pramDic;
        }
    if (_msg.isMineMsg) {
        self.giftView.isMine = YES;
    }else{
        self.giftView.isMine = NO;
    }
    
    _giftView.bounds = CGRectMake(0, 0, GIFT_CELL_WIDTH, GIFT_CELL_HEIGHT);
  
    
}







- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
