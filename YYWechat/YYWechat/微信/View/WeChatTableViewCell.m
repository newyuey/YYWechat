//
//  WeChatTableViewCell.m
//  YYWechat
//
//  Created by startiasoft on 2019/1/17.
//  Copyright © 2019 startiasoft. All rights reserved.
//

#import "WeChatTableViewCell.h"

@implementation WeChatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCellInterface];
    }
    return self;
}

-(void)setupCellInterface{
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView *superView = self.contentView;
    
    self.userImageView = [[UIImageView alloc] init];
    self.userImageView.contentMode = UIViewContentModeScaleToFill;
    self.userImageView.layer.cornerRadius = 5;
    self.userImageView.clipsToBounds = YES;
    
    self.nickNameLabel = [[UILabel alloc] init];
    self.nickNameLabel.font = [UIFont systemFontOfSize:16];
    self.nickNameLabel.textColor = [UIColor blackColor];
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    self.timeLabel.textColor = [UIColor blackColor];
    
    self.messageLabel = [[UILabel alloc] init];
    self.messageLabel.font = [UIFont systemFontOfSize:16];
    self.messageLabel.textColor = [UIColor blackColor];
    
    [superView addSubview:self.userImageView];
    [superView addSubview:self.nickNameLabel];
    [superView addSubview:self.timeLabel];
    [superView addSubview:self.messageLabel];
    
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.top.equalTo(superView.mas_top).with.offset(10);
        make.left.equalTo(superView.mas_left).with.offset(10);
        
    }];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userImageView.mas_top);
        make.left.equalTo(self.userImageView.mas_right).with.offset(10);
        make.height.equalTo(@(26));
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickNameLabel.mas_top);
        make.right.equalTo(superView.mas_right).with.offset(-10);
        make.height.equalTo(@(16));
    }];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickNameLabel.mas_left);
        make.bottom.equalTo(superView.mas_bottom).with.offset(-13);
        make.right.equalTo(superView.mas_right).with.offset(-10);
        make.height.equalTo(@(18));
    }];
}

-(void)setModel:(WeChatModel *)model{
//    self.model = model;
    self.userImageView.image = [UIImage imageNamed:model.imageName];
    self.nickNameLabel.text = model.nickName;
    self.timeLabel.text = model.time;
    self.messageLabel.text = model.message;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
