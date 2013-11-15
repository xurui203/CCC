
//  Created by Xu Rui on 13/11/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"

@interface Superpower : NSObject

@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) CCAnimation* transformIntoAnimation; //transforms into superpower
@property(strong, nonatomic) CCAnimation* transformFromAnimation; //transforms from superpower

@property(strong, nonatomic) CCAnimation* specialActionAnimation; //special action transformation

@property(strong, nonatomic) UIImage* icon;


//- (void*) useSuperpower;

- (CCAnimation*) makeTransformIntoAnimation;
- (CCAnimation*) makeTransformFromAnimation;
- (void) jump: (Player*) player;


@end
