//
//  YYBaseTableViewController.m
//  YYWechat
//
//  Created by startiasoft on 2019/1/16.
//  Copyright © 2019 startiasoft. All rights reserved.
//

#import "YYBaseTableViewController.h"

@interface YYBaseTableViewController ()

@end

@implementation YYBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSMutableArray *)dataSourceArray{
    if (!_dataSourceArray) {
        _dataSourceArray = [[NSMutableArray alloc] init];
    }
    return _dataSourceArray;
}



@end
