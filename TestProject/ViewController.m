//
//  ViewController.m
//  TestProject
//
//  Created by Alex Ponomarev on 19/08/15.
//  Copyright (c) 2015 Alex Ponomarev. All rights reserved.
//

#import "ViewController.h"
#import "RequestApi.h"
#import "GameObject.h"
#import "DataManager.h"

@interface ViewController () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *scoreValue;
@property (weak, nonatomic) IBOutlet UILabel *levelValue;
@property (weak, nonatomic) IBOutlet UIButton *addPoints;
@property (weak, nonatomic) IBOutlet UIButton *aboutLevels;
- (IBAction)addPoints:(id)sender;

@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger level;
@property (nonatomic) NSInteger additionalCounts;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GameObject *object = [[DataManager sharedManager] getSavedGame];
    
    if (object) {
        _score = [object.score integerValue];
        _level = [object.level integerValue];
        [self setupScoreAndLevel];
    } else {
        [self setupStartGame];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setupStartGame
{
    _additionalCounts = 0;
    _score = 0;
    _level = 1;
    [_scoreValue setText:[NSString stringWithFormat:@"%i", _score]];
    [_levelValue setText:[NSString stringWithFormat:@"%i", _level]];
    [self setupAdditionalCounts:Level_1];
}

- (IBAction)addPoints:(id)sender
{
    [self setupScoreAndLevel];
    UILabel *label = [[UILabel alloc] init];
    [label setText:[NSString stringWithFormat:@"+ %i", _additionalCounts]];
    [label setFont:[UIFont systemFontOfSize:24]];
    float randomNumber = [self getRandomNumberBetween:0.0 to:[UIScreen mainScreen].bounds.size.width];
    CGPoint position = CGPointMake(randomNumber, self.view.center.y);
    [label setFrame:CGRectMake(position.x, position.y, 100, 30)];
    [label setAlpha:0.0f];
    [self.view addSubview:label];
    
    [UIView animateWithDuration:1.0f animations:^{
        [label setAlpha:1.0f];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            [label setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}

-(float)getRandomNumberBetween:(int)from to:(int)to
{
    return (float)from + arc4random() % (to - from + 1);
}

- (void)setupAdditionalCounts:(LevelNumber)levelNumber
{
    switch (levelNumber) {
        case Level_1:
            _additionalCounts = 1;
            break;
        case Level_2:
            _additionalCounts = 2;
            break;
        case Level_3:
            _additionalCounts = 5;
            break;
        case Level_4:
            _additionalCounts = 7;
            break;
        case Level_5:
            _additionalCounts = 10;
            break;
        case Level_6:
            _additionalCounts = 12;
            break;
        case Level_7:
            _additionalCounts = 15;
            break;
        case Level_8:
            _additionalCounts = 20;
            break;
        case Level_9:
            _additionalCounts = 24;
            break;
        case Level_10:
            _additionalCounts = 27;
            break;
        case Level_11:
            _additionalCounts = 31;
            break;
        case Level_12:
            _additionalCounts = 32;
            break;
        case Level_13:
            _additionalCounts = 35;
            break;
   
        default:
            break;
    }
    
    [_addPoints setTitle:[NSString stringWithFormat:@"+ %li", (long)_additionalCounts] forState:UIControlStateNormal];
}

- (void)setupScoreAndLevel
{
    _score = _score + _additionalCounts;
    
    if (_score >= 12 && _score < 30) {
        _level = 2;
        [self setupAdditionalCounts:Level_2];
    } else if (_score >= 30  && _score < 70) {
        _level = 3;
        [self setupAdditionalCounts:Level_3];
    } else if (_score >= 70  && _score < 150) {
        _level = 4;
        [self setupAdditionalCounts:Level_4];
    } else if (_score >= 150  && _score < 250) {
        _level = 5;
        [self setupAdditionalCounts:Level_5];
    } else if (_score >= 250  && _score < 350) {
        _level = 6;
        [self setupAdditionalCounts:Level_6];
    } else if (_score >= 350  && _score < 500) {
        _level = 7;
        [self setupAdditionalCounts:Level_7];
    } else if (_score >= 500  && _score < 700) {
        _level = 8;
        [self setupAdditionalCounts:Level_8];
    } else if (_score >= 700  && _score < 1000) {
        _level = 9;
        [self setupAdditionalCounts:Level_9];
    } else if (_score >= 1000  && _score < 1500) {
        _level = 10;
        [self setupAdditionalCounts:Level_10];
    } else if (_score >= 1500  && _score < 2300) {
        _level = 11;
        [self setupAdditionalCounts:Level_11];
    } else if (_score >= 2300  && _score < 3000) {
        _level = 12;
        [self setupAdditionalCounts:Level_12];
    } else if (_score >= 3000) {
        [self setupAdditionalCounts:Level_13];
        [self endGame];
    }
    
    [_scoreValue setText:[NSString stringWithFormat:@"%i", _score]];
    [_levelValue setText:[NSString stringWithFormat:@"%i", _level]];
    GameObject *objectForSave = [[GameObject alloc] init];
    [objectForSave setLevel:_levelValue.text];
    [objectForSave setScore:_scoreValue.text];
    [[DataManager sharedManager] writeGameInFile:objectForSave];
}

- (void)endGame
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Победа!"
                                                    message:@"Вы выиграли!! :)"
                                                   delegate:self
                                          cancelButtonTitle:@"Начать заново"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self setupStartGame];
    }
}

@end
