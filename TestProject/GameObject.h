//
//  ProductObject.h
//  MagoraTestProject
//
//  Created by Alexandr on 22.07.15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GameObject : NSObject <NSCoding>

@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *score;

@end
