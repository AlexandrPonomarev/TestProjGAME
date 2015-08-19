//
//  RequestApi.h
//  TestProject
//
//  Created by Alex Ponomarev on 13/08/15.
//  Copyright (c) 2015 Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestApi : NSObject

+ (void)getLevelInfoWithComletionBlock:(void(^)(NSArray *result))completionBlock;

@end
