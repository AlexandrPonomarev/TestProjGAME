//
//  DataManager.h
//  MagoraTestProject
//
//  Created by Alexandr on 22.07.15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"

@interface DataManager : NSObject

- (GameObject *)getSavedGame;
- (void)writeGameInFile:(NSObject *)objectForSave;
+ (DataManager *)sharedManager;

@property (nonatomic) NSString *productName;
@property (nonatomic) NSString *productPrice;
@property (nonatomic) NSString *productDescription;

@end
