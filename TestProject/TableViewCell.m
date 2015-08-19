//
//  TableViewCell.m
//  TestProject
//
//  Created by Alex Ponomarev on 13/08/15.
//  Copyright (c) 2015 Alexandr. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *levelNumber;
@property (weak, nonatomic) IBOutlet UILabel *nextLevelCount;
@property (weak, nonatomic) IBOutlet UILabel *oneClickPoints;

@end

@implementation TableViewCell

- (void)setupCell:(LevelObject *)object
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [_levelNumber setText:object.levelNumber];
    [_nextLevelCount setText:object.nextLevelCount];
    [_oneClickPoints setText:object.additionalCount];
}

@end
