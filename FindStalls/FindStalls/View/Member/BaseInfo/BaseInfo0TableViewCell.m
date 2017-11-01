//
//  BaseInfo0TableViewCell.m
//  FindStalls
//
//  Created by lingnet on 2017/10/17.
//  Copyright © 2017年 徐仁强. All rights reserved.
//

#import "BaseInfo0TableViewCell.h"

#import "BaseInfo0Model.h"
@interface BaseInfo0TableViewCell()<UITextFieldDelegate>
@property (nonatomic, strong) UIView* _bgView;
@property (nonatomic, strong) UIView* _lineView;
@property (nonatomic, strong) UIView* _lineView1;
@property (nonatomic, strong) UIView* _lineView2;

@property (nonatomic, strong) UIImageView* _selectImageview;
@property (nonatomic, strong) UIImageView* _headImageview;
@property (nonatomic, strong) UILabel* _textLable;

@end
@implementation BaseInfo0TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self._lineView = [MyController viewWithFrame:self.contentView.frame];
    self._lineView.backgroundColor = [MyController colorWithHexString:@"f6f6f6"];
    [self.contentView addSubview:self._lineView];
    
    [self._lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_offset(11);
    }];
    
    self._lineView1 = [MyController viewWithFrame:self.contentView.frame];
    self._lineView1.backgroundColor = [MyController colorWithHexString:@"e2e2e2"];
    [self.contentView addSubview:self._lineView1];
    
    [self._lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self._lineView.mas_bottom);
        make.height.mas_offset(1);
    }];
    
    
    self._selectImageview = [MyController createImageViewWithFrame:self.contentView.frame ImageName:@"更多"];
    [self.contentView addSubview:self._selectImageview];
    
    [self._selectImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(35);
        make.height.mas_offset(25);
        make.width.mas_offset(25);
    }];
    
    self._headImageview = [MyController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    //将图层的边框设置为圆脚
    self._headImageview.layer.cornerRadius = 28;
    self._headImageview.layer.masksToBounds = YES;
    [self._headImageview setContentMode:UIViewContentModeScaleAspectFill];
    self._headImageview.clipsToBounds = YES;
    [self.contentView addSubview:self._headImageview];
    
    [self._headImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self._selectImageview.mas_left).mas_offset(-10);
        make.centerY.mas_equalTo(self._selectImageview.mas_centerY);
        make.width.mas_offset(56);
        make.height.mas_offset(56);
    }];
    
    self._textLable = [MyController createLabelWithFrame:self.contentView.frame Font:14 Text:@"头像"];
    [self.contentView addSubview:self._textLable];
    
    [self._textLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self._headImageview.mas_centerY);
    }];
    
    self._lineView2 = [MyController viewWithFrame:self.contentView.frame];
    self._lineView2.backgroundColor = [MyController colorWithHexString:@"eaeaea"];
    [self.contentView addSubview:self._lineView2];
    
    [self._lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self._headImageview.mas_bottom).mas_offset(11);
        make.height.mas_offset(10);
    }];
    
    self.hyb_lastViewInCell = self._lineView2;
    self.hyb_bottomOffsetToCell = 0;
    
    
}

- (void)configCellWithModel:(BaseInfo0Model *)model {
    [self._headImageview sd_setImageWithURL:[NSURL URLWithString:model._headImage] placeholderImage:[UIImage imageNamed:@"dealer"]];
    
}

@end
