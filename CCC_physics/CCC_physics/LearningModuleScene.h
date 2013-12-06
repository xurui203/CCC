//
//  LearningModule.h
//  CCC_physics
//
//  Created by guest user on 11/19/13.
//
//


#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "CCLayer.h"
#import "Defines.h"
#import "SceneManager.h"
#import "LearningModuleLayer.h"
//#import "CCVideoPlayer.h"


@interface LearningModuleScene : CCLayer 

@property(strong, nonatomic) NSString* moduleName;
@property(strong, nonatomic) NSString* animationFile;
@property(strong, nonatomic) NSString* animalPicture;
@property(nonatomic) BOOL isLocked;
@property(nonatomic) BOOL hasBeenWatched;

@property (nonatomic, assign) BOOL iPad;
@property (nonatomic, assign) NSString *device;
//@property (nonatomic)LearningModuleLayer *LMLayer;
//-(void)initWithSuperpower:(NSString *)moviename;

@end
