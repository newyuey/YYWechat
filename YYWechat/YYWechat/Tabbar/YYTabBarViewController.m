//
//  YYTabBarViewController.m
//  YYWechat
//
//  Created by startiasoft on 2019/1/16.
//  Copyright © 2019 startiasoft. All rights reserved.
//

#import "YYTabBarViewController.h"
#import "YYNavgationViewController.h"
#import "WeChatTableViewController.h"
#import "ContactsTableViewController.h"
#import "DiscoverTableViewController.h"
#import "MeTableViewController.h"
#define ITEM_COUNT  4
@interface YYTabBarViewController ()
@property(nonatomic,copy)NSArray *titleArr;
@property(nonatomic,copy)NSArray *imageArr;
@property(nonatomic,copy)NSArray *selImageArr;
@property(nonatomic,copy)NSArray *classNameArr;
@end

@implementation YYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArr = @[@"微信", @"通讯录", @"发现", @"我"];
    _imageArr = @[@"tabbar_mainframe", @"tabbar_contacts", @"tabbar_discover", @"tabbar_me"];
    _selImageArr = @[@"tabbar_mainframeHL", @"tabbar_contactsHL", @"tabbar_discoverHL", @"tabbar_meHL"];
    _classNameArr = @[@"WeChatTableViewController", @"ContactsTableViewController", @"DiscoverTableViewController", @"MeTableViewController"];
    // Do any additional setup after loading the view.
    
    for (int i = 0; i < ITEM_COUNT; i++) {
        UIViewController *vc = [NSClassFromString(_classNameArr[i]) new];
        vc.title = _titleArr[i];
        YYNavgationViewController *nav = [[YYNavgationViewController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = _titleArr[i];
        item.image = [UIImage imageNamed:_imageArr[i]];
        item.selectedImage = [[UIImage imageNamed:_selImageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : Global_tintColor} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
