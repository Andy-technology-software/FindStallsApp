//
//  MemberIndex0TableViewCell.m
//  FindStalls
//
//  Created by lingnet on 2017/10/17.
//  Copyright © 2017年 徐仁强. All rights reserved.
//

#import "MemberIndex0TableViewCell.h"

#import "MemberIndex0Model.h"
@interface MemberIndex0TableViewCell()<UITextFieldDelegate>
@property (nonatomic, strong) UIImageView* _bgImageview;

@property (nonatomic, strong) UIImageView* _levelImageview;
@property (nonatomic, strong) UIImageView* _vipImageview;
@property (nonatomic, strong) UILabel* _nameLable;

@property (nonatomic, strong) UIImageView* _headImageview;
@property (nonatomic, strong) UIButton* _headImageBtn;

@property (nonatomic, strong) UIButton* _seetingBtn;
@property (nonatomic, strong) UIButton* _seetingBtn1;
@property (nonatomic, strong) UIButton* _memberBtn;
@property (nonatomic, strong) UIButton* _memberBtn1;
@end

@implementation MemberIndex0TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}
- (void)makeUI{
    self._bgImageview = [MyController createImageViewWithFrame:self.contentView.frame ImageName:@"组-1"];
    self._bgImageview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self._bgImageview];
    
    [self._bgImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_offset([MyController getScreenWidth] * 30/64);
    }];
    
    
    self._memberBtn = [MyController createButtonWithFrame:self.contentView.frame ImageName:@"奖惩" Target:self Action:@selector(memberBtnClick) Title:nil];
    [self.contentView addSubview:self._memberBtn];
    
    [self._memberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(30);
        make.width.mas_offset(25);
        make.height.mas_offset(25);
    }];
    
    self._memberBtn1 = [MyController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(memberBtnClick) Title:nil];
    [self.contentView addSubview:self._memberBtn1];
    
    [self._memberBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(self._memberBtn.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self._memberBtn.mas_left).mas_offset(-5);
    }];
    
    
    self._seetingBtn = [MyController createButtonWithFrame:self.contentView.frame ImageName:@"设置" Target:self Action:@selector(seetingBtnClick) Title:nil];
    [self.contentView addSubview:self._seetingBtn];
    
    [self._seetingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self._memberBtn.mas_left).mas_offset(-15);
        make.top.mas_equalTo(self._memberBtn);
        make.width.mas_equalTo(self._memberBtn);
        make.height.mas_equalTo(self._memberBtn);
    }];
    
    self._seetingBtn1 = [MyController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(seetingBtnClick) Title:nil];
    [self.contentView addSubview:self._seetingBtn1];
    
    [self._seetingBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self._memberBtn1.mas_left).mas_offset(-15);
        make.top.mas_equalTo(self._memberBtn1);
        make.bottom.mas_equalTo(self._memberBtn1);
        make.left.mas_equalTo(self._seetingBtn.mas_left).mas_offset(-10);
    }];
    
    
    self._headImageview = [MyController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    //将图层的边框设置为圆脚
    self._headImageview.layer.cornerRadius = 33;
    self._headImageview.layer.masksToBounds = YES;
    [self._headImageview setContentMode:UIViewContentModeScaleAspectFill];
    self._headImageview.clipsToBounds = YES;
    [self.contentView addSubview:self._headImageview];
    
    [self._headImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(23);
        make.top.mas_equalTo(70);
        make.width.mas_offset(66);
        make.height.mas_offset(66);
    }];
    
    
    self._headImageBtn = [MyController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(headImageBtnClick) Title:nil];
    //将图层的边框设置为圆脚
    self._headImageBtn.layer.cornerRadius = 33;
    self._headImageBtn.layer.masksToBounds = YES;
    [self._headImageBtn setContentMode:UIViewContentModeScaleAspectFill];
    self._headImageBtn.clipsToBounds = YES;
    [self.contentView addSubview:self._headImageBtn];
    
    [self._headImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(23);
        make.top.mas_equalTo(70);
        make.width.mas_offset(66);
        make.height.mas_offset(66);
    }];
    
    self._nameLable = [MyController createLabelWithFrame:self.contentView.frame Font:16 Text:nil];
    self._nameLable.textColor = [UIColor whiteColor];
    self._nameLable.numberOfLines = 1;
    self._nameLable.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self._nameLable];
    
    [self._nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self._headImageBtn.mas_right).mas_offset(12);
        make.top.mas_equalTo(173/2);
        make.right.mas_lessThanOrEqualTo(-30);
    }];
    
    self._vipImageview = [MyController createImageViewWithFrame:self.contentView.frame ImageName:@"形状-53"];
    [self.contentView addSubview:self._vipImageview];
    
    [self._vipImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self._nameLable.mas_right).mas_offset(4);
        make.centerY.mas_equalTo(self._nameLable.mas_centerY);
        make.width.mas_offset(20);
        make.height.mas_offset(20);
    }];
    
    
    self._levelImageview = [MyController createImageViewWithFrame:self.contentView.frame ImageName:@"圆角矩形-1111"];
    [self.contentView addSubview:self._levelImageview];
    
    [self._levelImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self._headImageBtn.mas_right).mas_offset(7);
        make.top.mas_equalTo(self._nameLable.mas_bottom).mas_offset(7);
        make.width.mas_offset(135);
    }];
    
    
    self.hyb_lastViewInCell = self._bgImageview;
    self.hyb_bottomOffsetToCell = 0;
    
}

- (void)configCellWithModel:(MemberIndex0Model *)model {
    [self._headImageview sd_setImageWithURL:[NSURL URLWithString:model._headImage] placeholderImage:[UIImage imageNamed:@"图层-12"]];
    
    self._nameLable.text = model._name;
    
}

- (void)memberBtnClick {
    [self.MemberIndex0TableViewCellDelegate sendBackMember];
}

- (void)seetingBtnClick {
    [self.MemberIndex0TableViewCellDelegate sendBackSeeting];
}

- (void)headImageBtnClick {
    [self.MemberIndex0TableViewCellDelegate sendBackChangeHeadimage];
}

@end
