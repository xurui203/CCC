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

@interface LearningModule : CCLayer

@property(strong, nonatomic) NSString* moduleName;

@property(strong, nonatomic) NSString* animationFile;
@property(strong, nonatomic) NSString* animalPicture;
@property(strong, nonatomic) BOOL isLocked;
@property(nonatomic) BOOL hasBeenWatched;


@end
