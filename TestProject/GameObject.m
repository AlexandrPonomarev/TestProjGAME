//
//  ProductObject.m
//  MagoraTestProject
//
//  Created by Alexandr on 22.07.15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_level forKey:@"level"];
    [encoder encodeObject:_score forKey:@"score"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        _level = [decoder decodeObjectForKey:@"level"];
        _score  = [decoder decodeObjectForKey:@"score"];
    }
    
    return self;
}

@end
