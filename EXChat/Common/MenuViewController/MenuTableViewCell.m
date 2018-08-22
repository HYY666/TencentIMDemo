//
//  MenuTableViewCell.m
//  reader
//
//  Created by huang on 17/3/2.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import "MenuTableViewCell.h"
#import "UIImageView+WebCache.h"


#define REDPOINT_WIDTH      8.0f

@interface MenuTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *titleLabel;

//副标题label
@property (nonatomic, strong) UILabel *midLabel;

@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, strong) UIView *redPointView;

@property (nonatomic,strong) UIImageView *arrowsImageView;

@end


@implementation MenuTableViewCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    //    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        //线从左边哪里开始
//        self.leftSeparatorSpace = 50;
        self.topLineStyle = CellLineStyleNone;
        self.bottomLineStyle = CellLineStyleNone;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.midLabel];
        [self.contentView addSubview:self.rightImageView];
        [self.contentView addSubview:self.redPointView];
        [self.contentView addSubview:self.arrowsImageView];
        [self addMasonry];
    }
    return self;
}


- (void)setMenuItem:(HYYMenuItem *)menuItem {
    _menuItem = menuItem;
    [self.titleLabel setText:menuItem.title];
    [self.midLabel setText:menuItem.subTitle];
    if ([menuItem.title isEqualToString:@"个性签名"]) {
        self.midLabel.numberOfLines = 0;
    }
    
    if ([menuItem.title isEqualToString:@"用户ID"]||[menuItem.title isEqualToString:@"性别"]||[menuItem.title isEqualToString:@"等级"]) {
        [self.arrowsImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
        }];
    }
    if (menuItem.rightIconURL == nil) {
        [self.rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
        }];
    }
    else {
        [self.rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowsImageView.left).offset(-12);
        }];
        [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:menuItem.rightIconURL] placeholderImage:[UIImage imageNamed:DEFAULT_AVATAR]];
    }
    [self.redPointView setHidden:!menuItem.showRightRedPoint];
}


#pragma mark - Private Methods
- (void)addMasonry
{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(9);
        make.right.mas_lessThanOrEqualTo(self.contentView).mas_offset(15.0f);
    }];
    
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-30);
        make.centerY.mas_equalTo(self.contentView);
        make.width.and.height.mas_equalTo(60);
    }];
    
    [self.midLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_greaterThanOrEqualTo(self.titleLabel.mas_right).mas_offset(15);
        make.right.mas_equalTo(-29);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
    [self.redPointView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.rightImageView.mas_right).mas_offset(1);
        make.centerY.mas_equalTo(self.rightImageView.mas_top).mas_offset(1);
        make.width.and.height.mas_equalTo(REDPOINT_WIDTH);
    }];
    
    [self.arrowsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.centerY);
        make.right.equalTo(self.contentView).offset(-12);
    }];
    
    
}

#pragma mark - Getter
- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
//        _titleLabel.textColor = COLOR_RGB_GREYISHBROWNTWO;
        [_titleLabel setFont:FONT_14];
    }
    return _titleLabel;
}

- (UILabel *)midLabel
{
    if (_midLabel == nil) {
        _midLabel = [[UILabel alloc] init];
//        _midLabel.numberOfLines = 0;
//        [_midLabel setTextColor:COLOR_RGB_WARMGREYTWO];
        [_midLabel setFont:FONT_12];
    }
    return _midLabel;
}

- (UIImageView *)rightImageView
{
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc] init];
        _rightImageView.layer.cornerRadius = 30;
        _rightImageView.clipsToBounds = YES;
    }
    return _rightImageView;
}

- (UIView *)redPointView
{
    if (_redPointView == nil) {
        _redPointView = [[UIView alloc] init];
        [_redPointView setBackgroundColor:[UIColor redColor]];
        
        [_redPointView.layer setMasksToBounds:YES];
        [_redPointView.layer setCornerRadius:REDPOINT_WIDTH / 2.0];
        [_redPointView setHidden:YES];
    }
    return _redPointView;
}

- (UIImageView *)arrowsImageView{
    if (!_arrowsImageView) {
        _arrowsImageView = [[UIImageView alloc]init];
        _arrowsImageView.image = [UIImage imageNamed:@"arrows"];
    }
    return _arrowsImageView;
    
}
+ (CGFloat)calculateHeightWith:(HYYMenuItem *)mission {
    CGFloat height = [mission.subTitle boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-53, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine |   NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:FONT_12} context:nil].size.height+32;
    return height>44?height:44;
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
