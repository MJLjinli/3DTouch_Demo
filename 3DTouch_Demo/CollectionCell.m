//
//  CollectionCell.m
//  3DTouch_Demo
//
//  Created by 马金丽 on 17/7/13.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "CollectionCell.h"
#import <Masonry.h>

@interface CollectionCell()

@property(nonatomic,strong)UIImageView *contetnImageView;
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UILabel *topLabel;

@end


@implementation CollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self makeConstraints];
    }
    return self;
}

- (void)makeConstraints
{
    [self.contetnImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(15);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-15);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-10);
    }];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_contetnImageView.mas_top);
        make.left.mas_equalTo(_contetnImageView.mas_left);
        make.right.mas_equalTo(_contetnImageView.mas_right);
        make.height.mas_equalTo(35);
    }];
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_contetnImageView.mas_top);
        make.left.mas_equalTo(_contetnImageView.mas_left);
        make.right.mas_equalTo(_contetnImageView.mas_right);
        make.height.mas_equalTo(35);
    }];
}


- (void)cellDatawithDict:(NSDictionary *)dict
{
    self.contetnImageView.image = [UIImage imageNamed:[dict objectForKey:@"contentImageStr"]];
    self.topLabel.text = [dict objectForKey:@"decr"];
}

- (UIImageView *)contetnImageView
{
    if (!_contetnImageView) {
        _contetnImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _contetnImageView.contentMode = UIViewContentModeScaleAspectFill;
        _contetnImageView.clipsToBounds = YES;
        _contetnImageView.layer.cornerRadius = 10;
        _contetnImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_contetnImageView];
    }
    return _contetnImageView;
}

- (UIView *)topView
{
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectZero];
        _topView.backgroundColor = [UIColor blackColor];
        _topView.alpha = 0.5;
        [self.contetnImageView addSubview:_topView];
    }
    return _topView;
}


- (UILabel *)topLabel
{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _topLabel.font = [UIFont systemFontOfSize:14.0];
        _topLabel.textColor = [UIColor whiteColor];
        _topLabel.backgroundColor = [UIColor clearColor];
        _topLabel.textAlignment = NSTextAlignmentCenter;
        [self.contetnImageView addSubview:_topLabel];
    }
    return _topLabel;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    _topLabel.backgroundColor = [UIColor blackColor];
    _topLabel.alpha = 0.5;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
