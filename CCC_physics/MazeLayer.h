
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "Captain.h"

#import "ContactListener.h"
#import "HudLayer.h"
#import "SimpleAudioEngine.h"
#import "IconDrawer.h"
#import "CocosDenshion.h"
#import "World.h"


@class HudLayer;
@class IconDrawer;
@interface MazeLayer : CCLayer {
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
    CCSpriteBatchNode *geckoSpriteSheet;

    CCLayer *actionSpriteSheet;
    CCTextureCache *sharedCache;
    CGPoint firstTouch;
    CGPoint lastTouch;
    HudLayer *hud;
    int numCollected;

}
-(void) removeBody:(b2Body*) b;;

@property(nonatomic)HudLayer *hud;
@property(nonatomic)CCArray *collectiblesArray;
@property(nonatomic)IconDrawer *drawer;
@property(nonatomic)bool paused;
-(CGRect)collisionBoundingBox;

+(id) scene;

- (Captain*) getPlayer;


@end
