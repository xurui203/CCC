//
//  LearningModule.h
//  CCC_physics
//
//  Created by guest user on 11/19/13.
//
//

#import "CCLayer.h"
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "SceneManager.h"
#import "LearningModuleLayer.h"
#import "CCVideoPlayer.h"


@interface LearningModuleScene : CCLayer <CCVideoPlayerDelegate>

@property(strong, nonatomic) NSString* moduleName;
@property(strong, nonatomic) NSString* animationFile;
@property(strong, nonatomic) NSString* animalPicture;
@property(nonatomic) BOOL isLocked;
@property(nonatomic) BOOL hasBeenWatched;

@property (nonatomic, assign) BOOL iPad;
@property (nonatomic, assign) NSString *device;
@property (nonatomic)LearningModuleLayer *LMLayer;


@end
