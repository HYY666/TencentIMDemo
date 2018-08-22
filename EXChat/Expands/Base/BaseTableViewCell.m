//
//  BaseTableViewCell.m
//  reader
//
//  Created by huang on 17/3/2.
//  Copyright © 2017年 juyu. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)setTopLineStyle:(CellLineStyle)topLineStyle
{
    _topLineStyle = topLineStyle;
    [self setNeedsDisplay];
}

- (void)setBottomLineStyle:(CellLineStyle)bottomLineStyle
{
    _bottomLineStyle = bottomLineStyle;
    [self setNeedsDisplay];
}

- (void)setLeftSeparatorSpace:(CGFloat)leftSeparatorSpace
{
    _leftSeparatorSpace = leftSeparatorSpace;
    [self setNeedsDisplay];
}

- (void)setRightSeparatorSpace:(CGFloat)rightSeparatorSpace
{
    _rightSeparatorSpace = rightSeparatorSpace;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, BORDER_WIDTH_1PX * 2);
    CGContextSetStrokeColorWithColor(context, COLOR_RGB_WHITETHREE.CGColor);
    if (self.topLineStyle != CellLineStyleNone) {
        CGContextBeginPath(context);
        CGFloat startX = (self.topLineStyle == CellLineStyleFill ? 0 : _leftSeparatorSpace);
        CGFloat endX = self.frame.size.width - self.rightSeparatorSpace;
        CGFloat y = 0;
        CGContextMoveToPoint(context, startX, y);
        CGContextAddLineToPoint(context, endX, y);
        CGContextStrokePath(context);
    }
    if (self.bottomLineStyle != CellLineStyleNone) {
        CGContextBeginPath(context);
        CGFloat startX = (self.bottomLineStyle == CellLineStyleFill ? 0 : _leftSeparatorSpace);
        CGFloat endX = self.frame.size.width - self.rightSeparatorSpace;
        CGFloat y = self.frame.size.height;
        CGContextMoveToPoint(context, startX, y);
        CGContextAddLineToPoint(context, endX, y);
        CGContextStrokePath(context);
    }
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
