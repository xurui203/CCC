
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "Captain.h"

#import "ContactListener.h"
#import "HudLayer.h"
#import "SimpleAudioEngine.h"
#import "CocosDenshion.h"

@class HudLayer;
@interface MazeLayer : CCLayer <DirectionPadDelegate> {
    CCTMXTiledMap *_tileMap;
    CCSpriteBatchNode *_actors;
    Captain *player;
    ContactListener *contactListener;
    b2World* world;
    CCTMXLayer *_obstacles;
    NSMutableDictionary    *_objects;
    NSMutableDictionary *_endTilesDictionary;
    NSMutableArray *_collisionArray;
    CCSpriteBatchNode *humanSpriteSheet;
    CGPoint firstTouch;
    CGPoint lastTouch;
    HudLayer *hud;
    int numCollected;

}
-(void) removeBody:(b2Body*) b;;

@property(nonatomic)HudLayer *hud;
@property(nonatomic)CCArray *collisions;

-(CGRect)collisionBoundingBox;

+(id) scene;

- (Captain*) getPlayer;


@end
