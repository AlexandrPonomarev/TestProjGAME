//
//  DataManager.m
//  MagoraTestProject
//
//  Created by Alexandr on 22.07.15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "DataManager.h"
#import "GameObject.h"

static DataManager *sharedSettingsManager = nil;
static dispatch_once_t onceToken;

@implementation DataManager

+ (DataManager *)sharedManager {
    dispatch_once(&onceToken, ^{ sharedSettingsManager = [[DataManager alloc] init]; });
    return sharedSettingsManager;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (void)writeGameInFile:(NSObject *)objectForSave
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:objectForSave];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:@"Products"];
    
    return dataPath;
}

- (GameObject *)getSavedGame
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self dataFilePath]]) {
        NSMutableData* data = [[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
        GameObject *savedObject = [NSKeyedUnarchiver unarchiveObjectWithData:data];
     
        if (savedObject) {
            return savedObject;
        }
    }
    
    return nil;
}

@end
