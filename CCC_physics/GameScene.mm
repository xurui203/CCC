//
//  GameScene.m
//  

#import "GameScene.h" 
#import "GameData.h"
#import "GameDataParser.h"
#import "LevelParser.h"
#import "Levels.h"
#import "Level.h"
#import "MazeManager.h"


@implementation GameScene  
@synthesize iPad, device, spM;

- (void) setupPhysicsWorld {
    
    b2Vec2 gravity = b2Vec2(kHorizontalGravity, kVerticalGravity); // Set in TRBox2DConstants.h
//    bool doSleep = true;

    world = new b2World(gravity);
    
}

- (void)pauseButtonWasPressed:(id)sender {
    
    // pause the game
    _mazeLayer.paused = YES;
    
    // hide the pause button
    [pauseButton runAction:[CCFadeOut actionWithDuration:0.5]];
    
    // bring the sprite that shows the word 'Paused' into view
    [pausedSprite runAction:[CCMoveTo actionWithDuration:0.5
                                                position:ccp([CCDirector sharedDirector].winSize.width/2-10, [CCDirector sharedDirector].winSize.height/2+50)]];
    // bring the paued menu into view
    [pausedMenu runAction:[CCMoveTo actionWithDuration:0.5
                                              position:ccp([CCDirector sharedDirector].winSize.width/2, [CCDirector sharedDirector].winSize.height/2-100)]];
}
- (void)createPauseButton {
    
    // create sprite for the pause button
    pauseButton = [CCSprite spriteWithFile:@"PauseButton.png"];
    
    // create menu item for the pause button from the pause sprite
    CCMenuItemSprite *item = [CCMenuItemSprite itemFromNormalSprite:pauseButton
                                                     selectedSprite:nil
                                                             target:self
                                                           selector:@selector(pauseButtonWasPressed:)];
    
    // create menu for the pause button and put the menu item on the menu
    CCMenu *menu = [CCMenu menuWithItems: item, nil];
    [menu setAnchorPoint:ccp(0, 0)];
    [menu setIsRelativeAnchorPoint:NO];
    [menu setPosition:ccp([CCDirector sharedDirector].winSize.width/5, [CCDirector sharedDirector].winSize.height-30)];
    [menu setScale:0.3];
    [self addChild:menu];
}

- (void)createPausedMenu {
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    // create a sprite that says simply 'Paused'
    pausedSprite = [CCSprite spriteWithFile:@"Paused.png"];
    
    // create the quit button
    CCMenuItemSprite *item1 =
    [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"QuitButton.png"]
                            selectedSprite:nil
                                    target:self selector:@selector(quitButtonWasPressed:)];
//    // create the restart button
//    CCMenuItemSprite *item2 =
//    [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"RestartButton.png"]
//                            selectedSprite:nil
//                                    target:self
//                                  selector:@selector(restartButtonWasPressed:)];
    // create the resume button
    CCMenuItemSprite *item3 =
    [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"ResumeButton.png"]
                            selectedSprite:nil
                                    target:self
                                  selector:@selector(resumeButtonWasPressed:)];
    
    // put all those three buttons on the menu
    pausedMenu = [CCMenu menuWithItems:item1, item3, nil];
    
    // align the menu
    [pausedMenu alignItemsInRows:
     [NSNumber numberWithInt:1],
//     [NSNumber numberWithInt:1],
     [NSNumber numberWithInt:1],
     nil];
    
    // create the paused sprite and paused menu buttons off screen
    [pausedSprite setPosition:ccp(screenSize.width/2-10, screenSize.height + 200)];
    [pausedMenu setPosition:ccp(screenSize.width/2, -300)];
    
    // add the Paused sprite and menu to the current layer
    [self addChild:pausedSprite z:100];
    [self addChild:pausedMenu z:100];
}

- (void)quitButtonWasPressed:(id)sender {
    [SceneManager goLevelSelect];
}
//- (void)restartButtonWasPressed:(id)sender {
//    [SceneManager goMaze: currentMazeID];
//}
- (void)resumeButtonWasPressed:(id)sender {
    
    // unpause the game
    _mazeLayer.paused = NO;
    
    // show the pause button
    [pauseButton runAction:[CCFadeIn actionWithDuration:0.5]];
    
    // hide the sprite that shows the word 'Paused' from view
    [pausedSprite runAction:[CCMoveTo actionWithDuration:0.5
                                                position:ccp([CCDirector sharedDirector].winSize.width/2-10, [CCDirector sharedDirector].winSize.height + 200)]];
    // hide the paued menu from view
    [pausedMenu runAction:[CCMoveTo actionWithDuration:0.5
                                              position:ccp([CCDirector sharedDirector].winSize.width/2, -300)]];
    
}

- (id)initWithMaze: (int) mazeID{
    
    if( (self=[super init])) {

        // Determine Device
        self.iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        if (self.iPad) {
            self.device = @"iPad";
        }
        else {
            self.device = @"iPhone";
        }
        
        // Determine Screen Size
        CGSize screenSize = [CCDirector sharedDirector].winSize;  
        
  
        //  Put a 'back' button in the scene
        [self createPauseButton];

        [self createPausedMenu];
        
        
         spM = [SuperpowerManager sharedManager];
        
        currentMazeID = mazeID;
        [MazeManager sharedInstance].currentMapID = currentMazeID;
        [self createScene: mazeID];
        CCLOG(@"%d", spM.initiatedSPs.count);
        [self setupPhysicsWorld];
                
    
        
        CCSprite *background = [CCSprite spriteWithFile:@"Sky.png"];
        background.position = ccp(screenSize.width/2, screenSize.height/2);
        background.zOrder = -100;
        [self addChild:background];
        
        
        //Initialize a superpower manager instance
 
        // schedule Box2D updates
//        [self schedule: @selector(tick:)];

    }
    return self;
}

//EDIT: create scene with maze layer parameter
-(void) createScene: (int) mazeID {
    CCTMXTiledMap *map = [[MazeManager sharedInstance] getMapWithID:mazeID];
    _mazeLayer = [[[MazeLayer alloc] initWithTileMap: map] autorelease] ;
    [self addChild:_mazeLayer z:0];
    _hudLayer = [HudLayer node];
    [self addChild:_hudLayer z:1];
    
    
    _icondrawer = [IconDrawer node];
        [self addChild:_icondrawer z:2];
    CCLOG(@"%lu", (unsigned long)spM.initiatedSPs.count);
    if(spM.initiatedSPs != nil) {
        CCLOG(@"hereee");
        CCMenu *iconMenu = [_icondrawer initMenu:spM.initiatedSPs];
        [_icondrawer initDrawer];
//        [self addChild:iconMenu z:5];
        iconMenu.position = ccp(200, 175);
        iconMenu.zOrder = 5000;

        [self addChild:iconMenu z:5];
//        iconMenu.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
//        CCLOG(@"%hhd", iconMenu.visible);
//        
    }

    _mazeLayer.hud = _hudLayer;
    
    _mazeLayer.drawer = _icondrawer;

}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameScene *layer = [GameScene node];
	
	// add layer as a chisld to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


@end
