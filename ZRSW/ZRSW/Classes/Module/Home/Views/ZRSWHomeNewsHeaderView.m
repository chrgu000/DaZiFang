//
//  ZRSWHomeNewsHeaderView.m
//  ZRSW
//
//  Created by King on 2018/9/17.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "ZRSWHomeNewsHeaderView.h"

@interface ZRSWHomeNewsHeaderView ()
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation ZRSWHomeNewsHeaderView
- (instancetype)init{
    if (self = [super init]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    [self addSubview:self.leftImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.nextBtn];
    self.backgroundColor = [UIColor colorFromRGB:0xFFFFFF];

}

- (void)layoutSubviews{
    self.leftImageView.frame = CGRectMake(kUI_WidthS(15),kUI_HeightS(10), kUI_WidthS(3), kUI_HeightS(15));
    self.titleLabel.frame = CGRectMake(self.leftImageView.right + kUI_WidthS(10),kUI_HeightS(10), kUI_WidthS(128), kUI_HeightS(16));
    self.nextBtn.frame = CGRectMake(self.right - kUI_WidthS(21),kUI_HeightS(12), kUI_WidthS(6), kUI_HeightS(11));
}

- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc]init];
        _leftImageView.image = [UIImage imageNamed:@"currency_title_instructions"];
    }
    return _leftImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor colorFromRGB:0xFF21344F];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [[UIButton alloc] init];
        [_nextBtn setImage:[UIImage imageNamed:@"home_information_arrow"] forState:UIControlStateNormal];
        [self addSubview:_nextBtn];
        [_nextBtn addTarget:self action:@selector(getMore:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}

- (void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}

- (void)getMore:(UIButton *)btn {
    if (self.delegate!=nil && [self.delegate respondsToSelector:@selector(getMoreClick:title:)]) {
            [self.delegate getMoreClick:btn.tag title:self.titleLabel.text];
    }
}
@end
