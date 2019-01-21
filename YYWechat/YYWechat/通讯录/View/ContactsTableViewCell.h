//
//  ContactsTableViewCell.h
//  YYWechat
//
//  Created by startiasoft on 2019/1/21.
//  Copyright © 2019 startiasoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ContactsTableViewCell : UITableViewCell
@property(nonatomic, strong)ContactsModel *model;
@end

NS_ASSUME_NONNULL_END
