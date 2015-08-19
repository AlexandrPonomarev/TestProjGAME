//
//  LevelsInfoTableViewController.m
//  TestProject
//
//  Created by Alex Ponomarev on 19/08/15.
//  Copyright (c) 2015 Alex Ponomarev. All rights reserved.
//

#import "LevelsInfoTableViewController.h"
#import "RequestApi.h"
#import "TableViewCell.h"

@interface LevelsInfoTableViewController ()
{
    NSMutableArray *resultArray;
}

@end

static NSString *cellIdentifier = @"CellIdent";

@implementation LevelsInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    resultArray = [[NSMutableArray alloc] init];
    
    [RequestApi getLevelInfoWithComletionBlock:^(NSArray *result) {
        [resultArray addObjectsFromArray:result];
        [self.tableView reloadData];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return resultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *questionCell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [questionCell setupCell:[resultArray objectAtIndex:indexPath.row]];
    
    return questionCell;
}

@end
