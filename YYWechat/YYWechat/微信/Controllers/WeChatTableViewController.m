//
//  WeChatTableViewController.m
//  YYWechat
//
//  Created by startiasoft on 2019/1/16.
//  Copyright © 2019 startiasoft. All rights reserved.
//

#import "WeChatTableViewController.h"
#import "WeChatModel.h"
#import "WeChatTableViewCell.h"

#define kWeChatCellID @"wechatcellid"
@interface WeChatTableViewController ()

@end

@implementation WeChatTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 70;
    self.tableView.bounces = NO;
    UIView * footer = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.tableFooterView = footer;
    [self getCellDataSourceWithCount:2];
    [self.tableView registerClass:[WeChatTableViewCell class] forCellReuseIdentifier:kWeChatCellID];
    self.tableView.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)getCellDataSourceWithCount:(NSInteger)count{
    for (int i = 0; i < count; i++) {
        WeChatModel *model = [[WeChatModel alloc] init];
        model.imageName = @"669959983.jpg";
        model.nickName = @"周岳阳";
        model.time = @"16:10";
        model.message = @"....";
        [self.dataSourceArray addObject:model];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataSourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kWeChatCellID forIndexPath:indexPath];
    cell.model = self.dataSourceArray[indexPath.row];
    // Configure the cell...
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
