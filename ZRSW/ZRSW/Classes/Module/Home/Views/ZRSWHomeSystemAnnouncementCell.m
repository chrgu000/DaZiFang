//
//  ZRSWHomeSystemAnnouncementCell.m
//  ZRSW
//
//  Created by King on 2018/10/10.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "ZRSWHomeSystemAnnouncementCell.h"

@interface ZRSWHomeSystemAnnouncementCell()
@property (nonatomic, strong) UIImageView *topLineImge;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *dateLabel;

@end
@implementation ZRSWHomeSystemAnnouncementCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    self.selectedBackgroundView = [ZRSWViewFactoryTool getCellSelectedView:CGRectMake(0, 0, SCREEN_WIDTH, kUI_HeightS(120))];
    self.contentView.backgroundColor = [UIColor whiteColor];
    return self;
}
- (void)setUpUI{
    [self.contentView addSubview:self.topLineImge];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.dateLabel];
}

- (void)layoutSubviews{
    self.topLineImge.frame = CGRectMake((SCREEN_WIDTH - kUI_WidthS(360))/2 ,0, kUI_WidthS(360), kUI_HeightS(1));
    self.titleLabel.frame = CGRectMake(kUI_WidthS(15),kUI_HeightS(15), (SCREEN_WIDTH - kUI_WidthS(30)), kUI_HeightS(39));
//    [self.titleLabel sizeToFit];
    self.dateLabel.frame = CGRectMake(kUI_WidthS(15),self.titleLabel.bottom + kUI_HeightS(10), kUI_WidthS(150), kUI_HeightS(10));
}

- (UIImageView *)topLineImge{
    if (!_topLineImge) {
        _topLineImge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"currency_line_720"]];
    }
    return _topLineImge;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor colorFromRGB:0xFF444152];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}


- (UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.textColor = [UIColor colorFromRGB:0xFF4F4E5C];
        _dateLabel.textAlignment = NSTextAlignmentLeft;
        _dateLabel.font = [UIFont systemFontOfSize:10];
    }
    return _dateLabel;
}

- (void)setDetailModel:(NewDetailModel *)detailModel{
    _detailModel = detailModel;
    self.titleLabel.text = detailModel.title;
//    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
//    NSDate* date = [formatter dateFromString:detailModel.updateTime];
//    [formatter setDateFormat:@"yyyy.MM.dd"];
//    NSString *dateString = [formatter stringFromDate:date];
//    self.dateLabel.text = dateString;
    self.dateLabel.text = detailModel.updateTime;
}

- (void)setTopLineHidden:(BOOL)topLineHidden{
    _topLineHidden = topLineHidden;
    self.topLineImge.hidden = topLineHidden;
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
