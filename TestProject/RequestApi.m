//
//  RequestApi.m
//  TestProject
//
//  Created by Alex Ponomarev on 13/08/15.
//  Copyright (c) 2015 Alexandr. All rights reserved.
//

#import "RequestApi.h"
#import "LevelObject.h"

@implementation RequestApi

+ (void)getLevelInfoWithComletionBlock:(void(^)(NSArray *result))completionBlock
{
    NSString *jsonUrlString = @"https://gist.githubusercontent.com/AlexandrPonomarev/e425bc4bc70631f811e4/raw/59a1fdefceb5ccd271ca2de6bcecc0a13e835828/levels.json";
    NSURL *url = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSArray *preResult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
     
        if (completionBlock) {
            NSMutableArray *result = [NSMutableArray array];
            
            for (NSDictionary *dict in preResult) {
                LevelObject *object = [[LevelObject alloc] init];
                object.levelNumber = dict[@"level"];
                object.nextLevelCount = dict[@"nextLevelCount"];
                object.additionalCount = dict[@"additionalCount"];
                
                [result addObject:object];
            }
            
            completionBlock(result);
        }
    }];
}

@end
