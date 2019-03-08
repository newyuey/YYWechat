//
//  ContactsTableViewController.m
//  YYWechat
//
//  Created by startiasoft on 2019/1/16.
//  Copyright © 2019 startiasoft. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "ContactsTableViewCell.h"
#import "ContactsModel.h"

#define kContactsCellID @"kcontactscellid"
@interface ContactsTableViewController ()
@property (nonatomic,strong) NSMutableArray *sectionArray;

@property (nonatomic, strong) NSMutableArray *sectionTitlesArray;
@end

@implementation ContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 70;
    self.tableView.bounces = NO;
    UIView * footer = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.tableFooterView = footer;
    [self getCellDataSourceWithCount:28];
    [self.tableView registerClass:[ContactsTableViewCell class] forCellReuseIdentifier:kContactsCellID];
    self.tableView.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)getCellDataSourceWithCount:(NSInteger)count{
    NSArray *lastNameArr = @[@"赵",@"钱",@"孙",@"李",@"周",@"吴",@"郑",@"王",@"冯",@"陈",@"楚",@"卫",@"蒋",@"沈",@"韩",@"杨",@"先",@"秦",@"尤",@"许",@"何",@"吕",@"施",@"张",@"孔",@"曹",@"严",@"华",@"金",@"魏",@"陶",@"姜",@"👋"];
    NSArray *firstNameArr = @[@"建国",@"拥军",@"爱民",@"爱国",@"爱党",@"淑芬",@"铁柱",@"大牛",@"狗蛋",@"栓子",@"狗剩",@"腾飞",@"成功",@"成才"];
    for (int i = 0; i < count; i++) {
        NSString *lastNameStr = lastNameArr[arc4random_uniform((int)lastNameArr.count)];
        NSString *firstNameStr = firstNameArr[arc4random_uniform((int)firstNameArr.count)];
        NSString *name = [lastNameStr stringByAppendingString:firstNameStr];
        ContactsModel *model = [[ContactsModel alloc] init];
        model.iconImageName = @"669959983.jpg";
        model.nickName = name;
        [self.dataSourceArray addObject:model];
    }
    
    [self setupSectionDataSource];
}

-(void)setupSectionDataSource{
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    NSInteger sectionCount = [collation sectionTitles].count;
    NSMutableArray *newSectionArr = [NSMutableArray arrayWithCapacity:sectionCount];
    for (int i = 0; i < sectionCount; i++) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        [newSectionArr addObject:arr];
    }
    
    for (ContactsModel *model in self.dataSourceArray) {
        NSInteger sectionNum = [collation sectionForObject:model collationStringSelector:@selector(nickName)];
        NSMutableArray *sectionNames = newSectionArr[sectionNum];
        [sectionNames addObject:model];
    }
    
    for (int i = 0; i < sectionCount; i++) {
        NSMutableArray *personArrForSection = newSectionArr[i];
        NSArray *sortedPersonArrayForSection = [collation sortedArrayFromArray:personArrForSection collationStringSelector:@selector(nickName)];
        newSectionArr[i] = sortedPersonArrayForSection;
    }
    
    NSMutableArray *temp = [NSMutableArray new];
    self.sectionTitlesArray = [NSMutableArray new];
    
    [newSectionArr enumerateObjectsUsingBlock:^(NSArray *arr, NSUInteger idx, BOOL *stop) {
        if (arr.count == 0) {
            [temp addObject:arr];
        } else {
            [self.sectionTitlesArray addObject:[collation sectionTitles][idx]];
        }
    }];
    
    [newSectionArr removeObjectsInArray:temp];
    
    NSMutableArray *operrationModels = [NSMutableArray new];
    NSArray *dicts = @[@{@"name" : @"新的朋友", @"imageName" : @"plugins_FriendNotify"},
                       @{@"name" : @"群聊", @"imageName" : @"add_friend_icon_addgroup"},
                       @{@"name" : @"标签", @"imageName" : @"Contact_icon_ContactTag"},
                       @{@"name" : @"公众号", @"imageName" : @"add_friend_icon_offical"}];
    for (NSDictionary *dict in dicts) {
        ContactsModel *model = [ContactsModel new];
        model.nickName = dict[@"name"];
        model.iconImageName = dict[@"imageName"];
        [operrationModels addObject:model];
    }
    
    [newSectionArr insertObject:operrationModels atIndex:0];
    [self.sectionTitlesArray insertObject:@"" atIndex:0];
    
    self.sectionArray = newSectionArr;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.sectionTitlesArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.sectionArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kContactsCellID];
    if (!cell) {
        cell = [[ContactsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kContactsCellID];
    }
    cell.model = self.sectionArray[indexPath.section][indexPath.row];
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.sectionTitlesArray objectAtIndex:section];
}


- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.sectionTitlesArray;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
