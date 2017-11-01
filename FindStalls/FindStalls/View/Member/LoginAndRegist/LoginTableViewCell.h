//
//  LoginTableViewCell.h
//  FindStalls
//
//  Created by lingnet on 2017/10/16.
//  Copyright © 2017年 徐仁强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginModel;
@protocol LoginTableViewCellDelegate <NSObject>
- (void)sendBackName:(NSString*)name;
- (void)sendBackPwd:(NSString*)pwd;
- (void)sendBackLogin;
- (void)sendBackRegist;
@end
@interface LoginTableViewCell : UITableViewCell
- (void)configCellWithModel:(LoginModel *)model;
@property(nonatomic,weak)id<LoginTableViewCellDelegate>LoginTableViewCellDelegate;
@end
