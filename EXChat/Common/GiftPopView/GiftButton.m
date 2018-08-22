//
//  GiftButton.m
//  yeliao
//
//  Created by 趣融 on 2018/1/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GiftButton.h"

@interface GiftButton ()

@property (nonatomic,strong) UIImageView *giftImageView;
@property (nonatomic,strong) UIImageView *gouImageView;
@property (nonatomic,strong) UILabel *giftTitleLabel;
@property (nonatomic,strong) UILabel *giftSubTitleLabel;

@end


@implementation GiftButton
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
     return self;
}
- (void)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(NSString *)imageStr{
       [self.giftImageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:nil];
        [self addSubview:self.giftImageView];
        self.giftTitleLabel.text = title;
        [self addSubview:self.giftTitleLabel];
        self.giftSubTitleLabel.text = subTitle;
        [self addSubview:self.giftSubTitleLabel];
        [self addSubview:self.gouImageView];
        [self addMassonry];
}

- (void)addMassonry{
    [self.gouImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(w375(7));
        make.left.equalTo(w375(7));
        make.height.equalTo(w375(15));
        make.width.equalTo(0);
    }];
    [self.giftImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(w375(7));
        make.centerX.equalTo(self.centerX);
        make.height.equalTo(w375(45));
        make.width.equalTo(w375(45));
    }];
    
    [self.giftTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.giftSubTitleLabel.top).offset(w375(-7));
        make.centerX.equalTo(self.centerX);
        make.width.equalTo(self.width);
        make.height.equalTo(w375(15));
    }];
    
    [self.giftSubTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(w375(-7));
        make.centerX.equalTo(self.centerX);
        make.width.equalTo(self.width);
        make.height.equalTo(w375(15));
    }];
    
    
}
#pragma mark getter
- (UIImageView *)gouImageView{
    if (!_gouImageView) {
        _gouImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"select"]];
    }
    return _gouImageView;
}
- (UIImageView *)giftImageView{
    if (!_giftImageView) {
        _giftImageView = [[UIImageView alloc]init];
    }
    return _giftImageView;
}

- (UILabel *)giftTitleLabel{
    if (!_giftTitleLabel) {
        _giftTitleLabel = [[UILabel alloc]init];
        _giftTitleLabel.textAlignment = NSTextAlignmentCenter;
        _giftTitleLabel.font = FONT_14;
        _giftTitleLabel.textColor = Color_333;
    }
    return _giftTitleLabel;
}

- (UILabel *)giftSubTitleLabel{
    if (!_giftSubTitleLabel) {
        _giftSubTitleLabel = [[UILabel alloc]init];
        _giftSubTitleLabel.textAlignment = NSTextAlignmentCenter;
        _giftSubTitleLabel.font = FONT_14;
        _giftSubTitleLabel.textColor = Color_333;
    }
    return _giftSubTitleLabel;
}
- (void)setIsHidden:(BOOL)isHidden {
    if (isHidden) {
        [self.gouImageView updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(0);
        }];
    }else {
        [self.gouImageView updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(w375(15));
        }];
    }
    
}
@end
