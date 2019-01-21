//
//  ContactsTableViewCell.m
//  YYWechat
//
//  Created by startiasoft on 2019/1/21.
//  Copyright © 2019 startiasoft. All rights reserved.
//

#import "ContactsTableViewCell.h"
@implementation ContactsTableViewCell
{
    UIImageView *iconImageView;
    UILabel *nameLabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCellInterface];
    }
    return self;
}

-(void)setupCellInterface{
    UIView *superView = self.contentView;
    iconImageView = [[UIImageView alloc] init];
    nameLabel = [[UILabel alloc] init];
    nameLabel.textColor = [UIColor darkGrayColor];
    nameLabel.font = [UIFont systemFontOfSize:15];
    [superView addSubview:iconImageView];
    [superView addSubview:nameLabel];
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(superView);
        make.left.equalTo(superView.mas_left).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->iconImageView.mas_right).with.offset(10);
        make.centerY.equalTo(self->iconImageView);
    }];
}

-(void)setModel:(ContactsModel *)model{
    //    self.model = model;
    iconImageView.image = [UIImage imageNamed:model.iconImageName];
    nameLabel.text = model.nickName;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
