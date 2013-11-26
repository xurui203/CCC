//
//  GameScene.m
//  

#import "GameScene.h" 
#import "GameData.h"
#import "GameDataParser.h"
#import "LevelParser.h"
#import "Levels.h"
#import "Level.h"


@implementation GameScene  
@synthesize iPad, device, spM;

- (void) setupPhysicsWorld {
    
    b2Vec2 gravity = b2Vec2(kHorizontalGravity, kVerticalGravity); // Set in TRBox2DConstants.h
//    bool doSleep = true;

    world = new b2World(gravity);
    
}


- (void)onBack: (id) sender {
    [SceneManager goLevelSelect];
}


- (void)addBackButton {
    
    NSString *normal = [NSString stringWithFormat:@"Back Arrow.png"];
    NSString *selected = [NSString stringWithFormat:@"Back Arrow.png"];        
    CCMenuItemImage *goBack = [CCMenuItemImage itemFromNormalImage:normal 
                                                     selectedImage:selected
                                                            target:self 
                                                          selector:@selector(onBack:)];
    goBack.scale = .5;
    CCMenu *back = [CCMenu menuWithItems: goBack, nil];
    back.zOrder = 10;
    if (self.iPad) {
        back.position = ccp(64, 64);
        
    }
    else {
        back.position = ccp(32, 270);
    }
    
    [self addChild:back];        
}

//-(void) initMenu {
//    CCMenuItem *kangarooItem = [CCMenuItemImage
//                                itemFromNormalImage:@"Kangaroo Icon.png"
//                                selectedImage:@"Kangaroo Icon.png"
//                                target:self selector:@selector(kangarooButtonTapped:)];
//    kangarooItem.scale = 0.3;
//    
//    CCMenuItem *captainItem = [CCMenuItemImage
//                                itemFromNormalImage:@"CCC icon.png"
//                                selectedImage:@"CCC icon.png"
//                                target:self selector:@selector(humanButtonTapped:)];
//    captainItem.scale = 0.3;
//
//    
//    CCMenu *menu= [CCMenu menuWithItems:kangarooItem, captainItem, nil];
//    //CCMenu *menu2= [CCMenu menuWithItems:captainItem, nil];
//
//    menu.position = ccp(380, 280);
// //   menu2.position = ccp(300, 270);
//    [menu alignItemsHorizontally];
//    [self addChild: menu z:100];
//  //  [self addChild: menu2 z:101];
//
//}
//
//-(void)kangarooButtonTapped:(id) sender{
//    NSLog(@"kangaroo selected");
//    //Superpower *power = [Superpower init];
//    //    _human.superPowerAction = power.superpowerAction;
//    Kangaroo *kangarooSP = [[Kangaroo alloc] init];
//    [_mazeLayer.getPlayer transform: kangarooSP];
//}
//
//-(void)humanButtonTapped:(id) sender{
//    NSLog(@"kangaroo selected");
//    //Superpower *power = [Superpower init];
//    //    _human.superPowerAction = power.superpowerAction;
//    CaptainSP *captainSP = [[CaptainSP alloc] init];
//    [_mazeLayer.getPlayer transform: captainSP];
//}

- (id)init {
    
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
        [self addBackButton];
//        [self initMenu];
        

        
         spM = [SuperpowerManager sharedManager];
        
        
        [self createScene];
        CCLOG(@"%d", spM.initiatedSPs.count);
        [self setupPhysicsWorld];
        
//        [self limitWorldToScreen];
        
    
        
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

-(void) createScene {
    
    _mazeLayer = [MazeLayer node];
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
