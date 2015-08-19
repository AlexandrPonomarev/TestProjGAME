//
//  TableViewCell.h
//  TestProject
//
//  Created by Alex Ponomarev on 13/08/15.
//  Copyright (c) 2015 Alexandr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LevelObject.h"

@interface TableViewCell : UITableViewCell

- (void)setupCell:(LevelObject *)object;

@end
