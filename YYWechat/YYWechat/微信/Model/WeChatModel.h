//
//  WeChatModel.h
//  YYWechat
//
//  Created by startiasoft on 2019/1/17.
//  Copyright © 2019 startiasoft. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeChatModel : NSObject
@property(nonatomic, copy)NSString *imageName;
@property(nonatomic, copy)NSString *nickName;
@property(nonatomic, copy)NSString *time;
@property(nonatomic, copy)NSString *message;
@end

NS_ASSUME_NONNULL_END
