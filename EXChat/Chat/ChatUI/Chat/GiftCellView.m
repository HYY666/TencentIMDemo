//
//  GiftCellView.m
//  yeliao
//
//  Created by 趣融 on 2018/3/20.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GiftCellView.h"

@interface GiftCellView ()

@property (nonatomic,strong) UIImageView *giftImageView;

@property (nonatomic,strong) UILabel *giftLabel;

@property (nonatomic,strong) UILabel *subTitleLabel;


@end

@implementation GiftCellView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.giftImageView];
        [self addSubview:self.giftLabel];
        [self addSubview:self.subTitleLabel];
        [self addMassonry];
    }
    return self;
}

//#define GIFT_CELL_WIDTH  200
//#define GIFT_CELL_HEIGHT  60
- (void)addMassonry{
    [self.giftImageView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(60);
        make.height.equalTo(60);
        make.left.equalTo(0);
        make.top.equalTo(0);
    }];
    
    [self.giftLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.giftImageView.right).offset(0);
        make.top.equalTo(self.giftImageView.top).offset(0);
        make.right.equalTo(0);
        make.height.equalTo(30);
    }];
    
    [self.subTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.giftImageView.right).offset(0);
        make.top.equalTo(self.giftLabel.bottom).offset(0);
        make.right.equalTo(0);
        make.height.equalTo(30);
    }];
    
}


- (void)setDataDic:(NSDictionary *)dataDic{
    _dataDic = dataDic;
    [self.giftImageView sd_setImageWithURL:[NSURL URLWithString:_dataDic[@"giftImage"]]];
    self.giftLabel.text = [NSString stringWithFormat:@"送出[%@]",_dataDic[@"giftName"]];
    
}


- (void)setIsMine:(BOOL *)isMine{
    _isMine = isMine;
    if(isMine){
        _giftLabel.textColor = COLOR_WHITE;
        _subTitleLabel.textColor =  COLOR_BLACK;
    }else{
        _giftLabel.textColor = COLOR_BLACK;
        _subTitleLabel.textColor = Color_999;
    }
        
}



#pragma mark getter

- (UIImageView *)giftImageView{
    if (!_giftImageView) {
        _giftImageView = [[UIImageView alloc]init];
//        _giftImageView.contentMode = UIViewContentModeCenter;
    }
    return _giftImageView;
}

- (UILabel *)giftLabel{
    if (!_giftLabel) {
        _giftLabel = [[UILabel alloc]init];
        _giftLabel.textColor = [UIColor cyanColor];
        _giftLabel.font = FONT_16;
        _giftLabel.text = @"测试礼物";
    }
    return _giftLabel;
}

- (UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.textColor = [UIColor blackColor];
        _subTitleLabel.font = FONT_14;
        _subTitleLabel.text = @"已存入对方账户";
        
    }
    return _subTitleLabel;
}




@end
