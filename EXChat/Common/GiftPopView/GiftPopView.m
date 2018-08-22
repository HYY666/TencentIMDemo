//
//  GiftPopView.m
//  yeliao
//
//  Created by 趣融 on 2018/1/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GiftPopView.h"
#import "GiftModel.h"
#import "GiftButton.h"
#define BUTTONWIDTH (SCREEN_WIDTH-3)/4
@interface GiftPopView()<UIScrollViewDelegate>

@property(nonatomic,strong) UIView *backView;

@property (nonatomic,strong) NSArray *dataArr;

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UIPageControl *pageControl;

@property (nonatomic,assign) NSInteger index;

@property (nonatomic,assign) BOOL isRecharge;

@property (nonatomic,strong) UIButton *sendButton;

@end


@implementation GiftPopView

- (id)initWithDataArr:(NSArray *)dataArr clickBlock:(GiftClickBlock)clickBlock{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        
        self.dataArr = dataArr;
        self.clickBlock = clickBlock;
//        每次创建默认选中第一个
        self.index = 0;
//        if (isMask) {
//         self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
//        }else{
          self.backgroundColor = [UIColor clearColor];
//        }
        [self setUp];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClicked:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapClicked:(UITapGestureRecognizer *)tap{
    [self dismiss];
    
}
- (void)setUp{
    //弹出框背景
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 2*BUTTONWIDTH+51)];
    _backView.backgroundColor=[UIColor whiteColor];
    [self addSubview:_backView];
    
    [_backView addSubview:self.scrollView];
    NSInteger count = self.dataArr.count;
    while (count%8>0) {
        count++;
    }
    for (int i = 0; i <count; i ++) {
        GiftButton *button = [[GiftButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*(i/8)+(BUTTONWIDTH+1)*(i%4), (BUTTONWIDTH+1)*((i-(i/8)*8)/4), BUTTONWIDTH, BUTTONWIDTH)];
        button.backgroundColor = [UIColor grayColor];
        if (i<self.dataArr.count) {
            button.tag = i + 100;
            GiftModel *giftModel = self.dataArr[i];
            [button initWithTitle:giftModel.giftName subTitle:giftModel.giftGold image:giftModel.giftImage];
            [button addTarget:self action:@selector(giftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self.scrollView addSubview:button];
    }
     GiftButton *button = [self viewWithTag:100];
     button.isHidden = NO;
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 2*BUTTONWIDTH+1, SCREEN_WIDTH, 50)];
    bottomView.backgroundColor = COLOR_BLACK;
    [_backView addSubview:bottomView];
    UILabel *residueLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH-100, 25)];
    
    residueLab.text = [NSString stringWithFormat:@"剩余金币:%@",[UserHelper sharedHelper].user.userGold];
    residueLab.textColor = COLOR_WHITE;
    [bottomView addSubview:residueLab];
    UIButton *senderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    senderBtn.frame = CGRectMake(SCREEN_WIDTH-85, 20, 70, 25);
 
    self.sendButton = senderBtn;
    [self setSenderButtonType];
    [senderBtn setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
    senderBtn.layer.cornerRadius = 5;
    senderBtn.clipsToBounds = YES;
    senderBtn.backgroundColor = COLOR_RED;
    [senderBtn addTarget:self action:@selector(senderOperation) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:senderBtn];
    [bottomView addSubview:self.pageControl];
}

- (void)setSenderButtonType{
    GiftModel *model = self.dataArr[self.index];
   int giftGold = [model.giftGold intValue];
    int myGold = [[UserHelper sharedHelper].user.userGold intValue];
    if ( myGold < giftGold) {
        [self.sendButton setTitle:@"充值" forState:UIControlStateNormal];
        self.isRecharge = YES;
        
    }else{
        [self.sendButton setTitle:@"送礼" forState:UIControlStateNormal];
        self.isRecharge = NO;
    }
}


#pragma mark 发送礼物
- (void)senderOperation {
    NSLog(@"发送");
    if (self.clickBlock) {
        self.clickBlock(self.index, self.isRecharge);
    }
    [self dismiss];
}
- (void)giftButtonClicked:(GiftButton *)sender{
    for (int i=0; i<self.dataArr.count; i++) {
        GiftButton *button = [self viewWithTag:100+i];
        button.isHidden = YES;
    }
    self.index = sender.tag-100;
    sender.isHidden = NO;
    [self setSenderButtonType];
}




-(void)pageValueChange:(UIPageControl*)page{
    
    [UIView animateWithDuration:.35 animations:^{
        _scrollView.contentOffset = CGPointMake(page.currentPage*self.scrollView.frame.size.width, 0);
    }];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x/scrollView.frame.size.width;
    _pageControl.currentPage = index;
}



- (UIPageControl *)pageControl{
    if (!_pageControl) {
        //初始化pageControl
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.numberOfPages   = self.dataArr.count/8+1;
        _pageControl.currentPage     = 0;
        _pageControl.frame = CGRectMake(SCREEN_WIDTH/2-50, 0, 100, 20);
        [_pageControl setValue:[UIImage imageNamed:@"cyclescroll_dot_unselected"] forKeyPath:@"_pageImage"];
        [_pageControl setValue:[UIImage imageNamed:@"cyclescroll_dot_selected"] forKeyPath:@"_currentPageImage"];
        [_pageControl addTarget:self action:@selector(pageValueChange:) forControlEvents:UIControlEventValueChanged];
        
        
    }
    return _pageControl;
}


-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 2*BUTTONWIDTH+1)];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.userInteractionEnabled  = YES;
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*(self.dataArr.count/8+1), 2*BUTTONWIDTH+1);
        _scrollView.delegate        = self;
        _scrollView.pagingEnabled   = YES;
        _scrollView.bounces         = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (void)show{
    UIView * keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:self];
    
    __weak __typeof(self)weakSelf = self;
    
    [UIView animateWithDuration:.15 animations:^{
        
        weakSelf.backView.frame = CGRectMake(0, SCREEN_HEIGHT-(2*BUTTONWIDTH+51), SCREEN_WIDTH, 2*BUTTONWIDTH+51);
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)dismiss {
    
    __weak __typeof(self)weakSelf = self;
    
    [UIView animateWithDuration:.15 animations:^{
        
        weakSelf.backView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 2*BUTTONWIDTH+51);
        
    } completion:^(BOOL finished) {
        
        weakSelf.backView = nil;
        [weakSelf removeFromSuperview];
    }];
    
}

@end
