//
//  WeChatTableViewCell.h
//  YYWechat
//
//  Created by startiasoft on 2019/1/17.
//  Copyright © 2019 startiasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeChatModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeChatTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView *userImageView;
@property(nonatomic, strong)UILabel *nickNameLabel;
@property(nonatomic, strong)UILabel *timeLabel;
@property(nonatomic, strong)UILabel *messageLabel;

@property(nonatomic, strong)WeChatModel *model;
@end

NS_ASSUME_NONNULL_END
