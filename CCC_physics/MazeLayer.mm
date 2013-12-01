

#import "MazeLayer.h"
#import "SimpleAudioEngine.h"

//@interface MazeLayer(Private)
//-(void) setupPhysicsWorld;
//@end

@implementation MazeLayer


@synthesize hud;
@synthesize collectiblesArray, paused;


-(id)initWithTileMap: (CCTMXTiledMap*) tileMap {
    if ((self = [super init])) {
        self.isTouchEnabled = YES;
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];

        
        [self setupPhysicsWorld];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"sbm.mp3"];
        [self initTileMap: tileMap];
        NSLog(@"LOADING PLISTS!!!");
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Human_Kangaroo.plist"];
        humanSpriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"Human_Kangaroo.png"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Dog_Gecko.plist"];
         geckoSpriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"Dog_Gecko.png"];
        [humanSpriteSheet.texture setAliasTexParameters];
        [geckoSpriteSheet.texture setAliasTexParameters];

        [self addChild:humanSpriteSheet z:2];
        [self addChild:geckoSpriteSheet z:2];

        [self drawCollisionTiles];
        [self initCaptain];
        
        [self drawGameOverTiles];
        [self drawEndTiles];
        [self drawCollectibles];
        [self scheduleUpdate];
        numCollected = 0;
        
    }
    return self;
}


+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	MazeLayer *layer = [MazeLayer node];
    
	// add layer as a child to scene
	[scene addChild: layer];
    
	// return the scene
	return scene;
}


- (void) makeBox2dObjAt:(CGPoint)p
			   withSize:(CGPoint)size
				dynamic:(BOOL)d
			   rotation:(long)r
			   friction:(long)f
				density:(long)dens
			restitution:(long)rest
				  boxId:(int)boxId
               uniqueID:(int)uniqueID                  {
    
	// Define the dynamic body.
	//Set up a 1m squared box in the physics world
	b2BodyDef bodyDef;
    //	bodyDef.angle = r;
    
	if(d)
		bodyDef.type = b2_dynamicBody;
    
	bodyDef.position.Set(p.x/PTM_RATIO, p.y/PTM_RATIO);
    
    if (uniqueID == 1) {
        GameObject *platform = [[GameObject alloc] init];
        [platform setType:kGameObjectPlatform];
        bodyDef.userData = platform;
    }
    if (uniqueID == 2) {
        GameObject *gameOverTile= [[GameObject alloc] init];
        [gameOverTile setType:kGameObjectGameOverTile];
        bodyDef.userData = gameOverTile;
        NSLog(@"done creating game over tile");
    }
    if (uniqueID == 3) {
        GameObject *endTile= [[GameObject alloc] init];
        [endTile setType:kGameObjectEndTile];
        bodyDef.userData = endTile;
        NSLog(@"done creating game over tile");
    }
    if (uniqueID >= 4) {
        GameObject *collectible= [[GameObject alloc] initWithFile:@"Apple.png"];
        [collectible setType:kGameObjectCollectible];
        bodyDef.userData = collectible;
        [self addChild:collectible];
        collectible.scale = .5;
        collectible.zOrder = 2;
        
        NSLog(@"done creating collectible tile");
    }
    
    
	b2Body *body = world->CreateBody(&bodyDef);
    
	// Define another box shape for our dynamic body.
	b2PolygonShape dynamicBox;
	dynamicBox.SetAsBox(size.x/2/PTM_RATIO, size.y/2/PTM_RATIO);
    
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicBox;
	fixtureDef.density = dens;
	fixtureDef.friction = f;
	fixtureDef.restitution = rest;
	body->CreateFixture(&fixtureDef);
}



- (void) drawCollisionTiles {
	CCTMXObjectGroup *objects = [_tileMap objectGroupNamed:@"collisions"];
	NSMutableDictionary * objPoint;
    
	int x, y, w, h;
	for (objPoint in [objects objects]) {
        NSLog(@"collision objects detected");
		x = [[objPoint valueForKey:@"x"] intValue]/2;
		y = [[objPoint valueForKey:@"y"] intValue]/2;
		w = [[objPoint valueForKey:@"width"] intValue]/2;
		h = [[objPoint valueForKey:@"height"] intValue]/2;
        
		CGPoint _point=ccp(x+w/2,y+h);
		CGPoint _size=ccp(w,h);
        
		[self makeBox2dObjAt:_point
					withSize:_size
					 dynamic:false
					rotation:0
					friction:1.5f
					 density:0.0f
				 restitution:0
					   boxId:-1
                    uniqueID:1];
	}
}

- (void) drawGameOverTiles {
	CCTMXObjectGroup *objects = [_tileMap objectGroupNamed:@"gameOverLayer"];
	NSMutableDictionary * objPoint;
    
	int x, y, w, h;
	for (objPoint in [objects objects]) {
        NSLog(@"game over objects detected");
		x = [[objPoint valueForKey:@"x"] intValue]/2;
		y = [[objPoint valueForKey:@"y"] intValue]/2;
		w = [[objPoint valueForKey:@"width"] intValue]/2;
		h = [[objPoint valueForKey:@"height"] intValue]/2;
        
		CGPoint _point=ccp(x+w/2,y+h);
		CGPoint _size=ccp(w,h);
        
		[self makeBox2dObjAt:_point
					withSize:_size
					 dynamic:false
					rotation:0
					friction:1.5f
					 density:0.0f
				 restitution:0
					   boxId:-1
                    uniqueID:2];
	}
}
- (void) drawEndTiles {
	CCTMXObjectGroup *objects = [_tileMap objectGroupNamed:@"end"];
	NSMutableDictionary * objPoint;
    
	int x, y, w, h;
	for (objPoint in [objects objects]) {
        NSLog(@"end objects detected");
		x = [[objPoint valueForKey:@"x"] intValue]/2;
		y = [[objPoint valueForKey:@"y"] intValue]/2;
		w = [[objPoint valueForKey:@"width"] intValue]/2;
		h = [[objPoint valueForKey:@"height"] intValue]/2;
        
		CGPoint _point=ccp(x+w/2,y+h);
		CGPoint _size=ccp(w,h);
        
		[self makeBox2dObjAt:_point
					withSize:_size
					 dynamic:false
					rotation:0
					friction:1.5f
					 density:0.0f
				 restitution:0
					   boxId:-1
                    uniqueID:3];
	}
}



- (void) drawCollectibles {
	CCTMXObjectGroup *objects = [_tileMap objectGroupNamed:@"collectibles"];
	NSMutableDictionary * objPoint;
    
	int x, y, w, h;
    int num = 4;
	for (objPoint in [objects objects]) {
        NSLog(@"collectible detected");
		x = [[objPoint valueForKey:@"x"] intValue]/2;
		y = [[objPoint valueForKey:@"y"] intValue]/2;
		w = [[objPoint valueForKey:@"width"] intValue]/2;
		h = [[objPoint valueForKey:@"height"] intValue]/2;
        
		CGPoint _point=ccp(x+w/2,y+h/2);
		CGPoint _size=ccp(w,h);

        
		[self makeBox2dObjAt:_point
					withSize:_size
					 dynamic:false
					rotation:0
					friction:1.5f
					 density:0.0f
				 restitution:0
					   boxId:-1
                    uniqueID:num];
        
        num++;
	}
    
//    collectiblesArray = [CCArray arrayWithCapacity:num-4];
//    for(int i=0; i<num-4; i++)
//    {
//        for (objPoint in [objects objects])
//        {
//            GameObject *collectItem = [[GameObject alloc] initWithSpriteFrameName:@"Apple.png"];
//        }}
    
}
-(void) removeBody:(b2Body*) b {
    world->DestroyBody(b);;
}



-(void) setupPhysicsWorld {
    
    b2Vec2 gravity = b2Vec2(0.0f, -9.8f);
    world = new b2World(gravity);

    contactListener = new ContactListener();
    world->SetContactListener(contactListener);
}


-(void)initTileMap: (CCTMXTiledMap*) tileMap {
   
    //_tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"test_map.tmx"];
    _tileMap = tileMap;
    _tileMap.scale = .5;
	_tileMap.anchorPoint = ccp(0, 0);
	[self addChild:_tileMap];
}


-(void)initCaptain {
    
    NSLog(@"initizaling captain");
    
//    player = [Captain spriteWithSpriteFrameName:@"Lat Capt Human-Standing001.png"];
    player = [[World sharedWorld] CCCplayer];
   
    NSLog(@"adding player to spritesheet");
    //[humanSpriteSheet addChild:player];
    player.zOrder = 500;
    NSLog(@"didnt die at add player to humanspritesheet...");
    player.scale = 0.4;
    player.position = ccp(100, 400);
    [player createBox2dObject:world];
    [self addChild:player];
    [player idle];

}


-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
   
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    firstTouch = location;
//    SuperpowerManager *spm = [SuperpowerManager alloc];
//    NSMutableArray *SPArray = spm.iconsArrayCopy;
//    
//    for (int x=0; x<SPArray.count; x++) {
//
//        CCSprite *icon = [SPArray objectAtIndex:x];
//        
//        if (CGRectContainsPoint(icon.boundingBox, location)) {
//            CCLOG(@"touched icon");
//        }
//    }
    
    if (player.actionState == kActionStateIdle){

    if (location.x <= screenSize.width && location.y >= 100) {
        [player walk];
    }
    if (location.y < 80) {
        //player.position = ccp(player.position.x, player.position.y-50);
        [player crawl];
        ;
    }
    if (location.x >= screenSize.width/2 && location.y > 230) {
        //player.position = ccp(player.position.x, player.position.y-50);
        [player jump];
        ;
        
    }
    // [player jump];
    }
	return TRUE;
}


-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
//    if (player.actionState == kActionStateIdle) {
//        [player idle];
//    }
    NSSet *allTouches = [event allTouches];
        UITouch * currentTouch = [[allTouches allObjects] objectAtIndex:0];
        CGPoint location = [currentTouch locationInView: [currentTouch view]];
        location = [[CCDirector sharedDirector] convertToGL:location];
    
        //Swipe Detection Part 2
        lastTouch = location;
    
        //Minimum length of the swipe
        float swipeLength = ccpDistance(firstTouch, lastTouch);
    
        //Check if the swipe is a left swipe and long enough
        if (firstTouch.x > lastTouch.x && swipeLength > 60) {
        [player crawl];
        }
}




-(void)update:(ccTime)dt {
//    [player update:dt];
//    float posX = MAX(_tileMap.mapSize.width * _tileMap.tileSize.width - player.centerToSides, MAX(player.centerToSides, player.desiredPosition.x));
//    float posY = MAX(3 * _tileMap.tileSize.height + player.centerToBottom, MAX(player.centerToBottom, player.desiredPosition.y));
//    player.position = ccp(posX, posY);
//

    if (!paused) {
    int32 velocityIterations = 8;
	int32 positionIterations = 1;
    
    if (contactListener->collected > numCollected) {
        //        if (contactListener->collectible != nil) {
        //            CCLOG(@"contact listener -> collectible: %u",  );
        ////            [self removeBody:contactListener->collectible];
        
        //
        //        }
        numCollected ++;
        [player updateHealth];
        //CCLOG(@"updating player health");
        //    world->DestroyBody(contactListener->collectible);
    }
    [hud setHealth:player.health];
    
   // CCLOG(@"player health: %d", player.health);
    

    
	// Instruct the world to perform a single step of simulation. It is
	// generally best to keep the time step and iterations fixed.
	world->Step(dt, velocityIterations, positionIterations);
	
	//Iterate over the bodies in the physics world
	for (b2Body* b = world->GetBodyList(); b; b = b->GetNext()) {
		if (b->GetUserData() != NULL) {
			//Synchronize the AtlasSprites position and rotation with the corresponding body
			CCSprite *myActor = (CCSprite*)b->GetUserData();
			myActor.position = CGPointMake( b->GetPosition().x * PTM_RATIO,
										   b->GetPosition().y * PTM_RATIO);
			myActor.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());
		}
	}
	
	b2Vec2 pos = [player body]->GetPosition();
  
	CGPoint newPos = ccp(-1* pos.x * PTM_RATIO + 50, self.position.y * PTM_RATIO);
	[self setPosition:newPos];
   // [self setViewpointCenter:player.position];
    // [self setViewpointCenter:player.position];
    std::vector<b2Body *>toDestroy;
    std::vector<MyContact>::iterator p;
    for (p= contactListener->_contacts.begin();
         p != contactListener->_contacts.end(); ++p) {
        MyContact contact = *p;
        
        b2Body *bodyA = contact.fixtureA->GetBody();
        b2Body *bodyB = contact.fixtureB->GetBody();
        
        if (bodyA->GetUserData() != NULL && bodyB->GetUserData() != NULL) {
            GameObject *spriteA = (GameObject *) bodyA->GetUserData();
            GameObject *spriteB = (GameObject *) bodyB->GetUserData();
            
            if (spriteA.type == kGameObjectEaten) {
                if (std::find(toDestroy.begin(), toDestroy.end(), bodyA) == toDestroy.end()) {
                    toDestroy.push_back(bodyA);
                }
            }
            
            else if (spriteB.type == kGameObjectEaten) {
                if (std::find(toDestroy.begin(), toDestroy.end(), bodyB) == toDestroy.end()) {
                    toDestroy.push_back(bodyB);
                }
            }
        }

    }
    
    std::vector<b2Body *>::iterator pos2;
    for (pos2 = toDestroy.begin(); pos2 != toDestroy.end(); ++pos2) {
        b2Body *body = *pos2;
        if (body->GetUserData() != NULL) {
            GameObject *sprite = (GameObject *) body->GetUserData();
            [self removeChild:sprite cleanup:YES];
        }
        world->DestroyBody(body);
    }
    
    }

}


- (Captain*) getPlayer{
    return player;
}


-(void)setViewpointCenter:(CGPoint) position {
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    int x = MAX(position.x, winSize.width / 2);
    int y = MAX(position.y, winSize.height / 2);
    x = MIN(x, (_tileMap.mapSize.width * _tileMap.tileSize.width)
            - winSize.width / 2);
    y = MIN(y, (_tileMap.mapSize.height * _tileMap.tileSize.height)
            - winSize.height/2);
    CGPoint actualPosition = ccp(x, y);
    
    CGPoint centerOfView = ccp(winSize.width/2, winSize.height/2);
    CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
    self.position = viewPoint;
}



-(void)dealloc {
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
    [self unscheduleUpdate];
//    [player dealloc];
    [self removeChild:player cleanup:YES];
//    [player.currentSuperpower relea=se];
    [super dealloc];
}

@end
