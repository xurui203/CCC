

#import "Captain.h"


@implementation Captain


-(id)init {
    CCLOG(@"CAPTAIN: INIT");
    if (self = [super init]){

        CCLOG(@"init human");

        //Set default superpower to captain
        self.currentSuperpower = [[[CaptainSP alloc] init] autorelease];
//        [self.currentSuperpower init];
        
        
//        CCLOG(@"Got HERE after loading current superpower!");
        
        //Set idle action
        self.idleAction = [[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: [self.currentSuperpower getIdleAnimation]]] autorelease];
                           
          //Set walk action
        self.walkAction = [[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: [self.currentSuperpower getWalkAnimation]]] autorelease];
                           
        //Set crawl action
        self.crawlAction = [[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: [self.currentSuperpower getCrawlAnimation]]] autorelease];
        
        self.jumpAction = [[CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getJumpAnimation]], nil] autorelease];
        
        self.spAction = [[CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getSpAnimation]], nil] autorelease];
        
        //Set some initial values for the hero’s attributes, including the measurements from the center of the sprite to the sides and bottom
        self.centerToBottom = 39.0;
        self.centerToSides = 29.0;
        self.hitPoints = 100.0;
        self.damage = 20.0;
        self.walkSpeed = 80;
        self.upright = true;
        
    }
    CCLOG(@"captain init but without frame");
    return self;
}


- (void) reset {
    self.currentSuperpower = [[CaptainSP alloc] init];
//    [self.currentSuperpower init];
    [self restoreHealth:MAX_HEALTH];
//    self.currentSuperpower = CaptainSP
}


#define JUMP_TAG 1001

-(void)idle {
    CCLOG(@"IDLING");
    
    CCLOG(@"old position is %f", self.position.x);
    
    if (_actionState == kActionStateBreak){
        NSLog(@"JUMP EXECUTING");
        [super kangarooJump];
    }
    
    else {//(_actionState != kActionStateIdle){
        NSLog(@"STATE IS NOT IDLE");
        [self stopAllActions];
        _idleAction = [CCSequence actions:[CCAnimate actionWithAnimation:self.currentSuperpower.getIdleAnimation], nil];

        [self runAction:_idleAction];
        _actionState = kActionStateIdle;
        _velocity = CGPointZero;
    }
}

//Use this method to reset superpower. This method should be called whenever an icon is clicked from the superpower menu.
- (void)transform:(Superpower*) superpower{
    self.breakingWall = FALSE;
    //if ([[[World sharedWorld] CCCplayer] numberOfRunningActions] ==0){
    if (self.numberOfRunningActions ==0){

    [self stopAllActions];
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    [self runAction:[CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getTransformFromAnimation]], nil]]; //Transform from current state
    self.currentSuperpower = superpower;
    [self runAction:[CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getTransformIntoAnimation]], nil]]; //Transform into superpower state
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);

    _actionState = kActionStateIdle;
    }
}

-(void)walk {
    self.breakingWall = FALSE;
    if (!self.currentSuperpower.canWalk) return;
    if (_actionState != kActionStateWalk){ //&& [self numberOfRunningActions] ==0){
        [self stopAllActions];
        if (self.isCrawling){
            [self changeToStandFixture];
        }
        _walkAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getWalkAnimation]], nil];
        [self runAction:_walkAction];
        _actionState = kActionStateWalk;
    }
    
    if (_actionState == kActionStateWalk) {
        [self.currentSuperpower moveRight:self];
    }
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;

}

-(void)moveBackwards {
    self.breakingWall = FALSE;
    if (!self.currentSuperpower.canWalk) return;
    if (_actionState != kActionStateWalk){ //&& [self numberOfRunningActions] ==0){
        [self stopAllActions];
        if (self.isCrawling){
            [self changeToStandFixture];
        }
        _walkAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getWalkAnimation]], nil];
        [self runAction:_walkAction];
        _actionState = kActionStateWalk;
    }
    
    if (_actionState == kActionStateWalk) {
        [self.currentSuperpower moveLeft:self];
    }
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;
    
}

-(void)jump {
    self.breakingWall = FALSE;
    if (!self.currentSuperpower.canJump) return;
    if (_actionState != kActionStateJump){
        [self stopAllActions];
        if (self.isCrawling){
            [self changeToStandFixture];
        }
        _jumpAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getJumpAnimation]], nil];

        [self runAction:_jumpAction];
        _actionState = kActionStateJump;
    }
    
    if (_actionState == kActionStateJump) {
        [self.currentSuperpower jump:self];
    }
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;

}

-(void)specialAction {
    NSLog(@"Break wall method reached!!!");

    if (!self.currentSuperpower.canSP) return;
    if (_actionState != kActionStateSpecialAction){
        [self stopAllActions];
        if (self.isCrawling){
            [self changeToStandFixture];
        }
        _spAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getSpAnimation]], nil];
        [self runAction:_spAction];
        _actionState = kActionStateSpecialAction;
        NSLog(@"Captain class: executing special action");
    }
    
    if (_actionState == kActionStateSpecialAction) {
        [self.currentSuperpower spAction:self];
    }
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;
    self.breakingWall = TRUE;
}

-(void)crawl {
    self.breakingWall = FALSE;
    if (!self.currentSuperpower.canCrawl) return;
    if (_actionState != kActionStateCrawl){ //&& [self numberOfRunningActions] ==0){
        [self stopAllActions];
        if (!self.isCrawling){
        [self changeToCrawlFixture];
        }
        _crawlAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getCrawlAnimation]], nil];
        [self runAction:_crawlAction];
        _actionState = kActionStateCrawl;
    }
    NSLog(@"PLS WORK PLS");
    
    if (_actionState == kActionStateCrawl) {
        _velocity = ccp(2.0, 0);
        [self.currentSuperpower crawl:self];
    }
    
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;

}

-(void)climb: (b2Vec2) direction {
    self.breakingWall = FALSE;
    if (!self.currentSuperpower.canClimb) return;    
    if (_actionState != kActionStateCrawl){ //&& [self numberOfRunningActions] ==0){
        [self stopAllActions];
        _climbAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getCrawlAnimation]], nil];
        [self runAction:_crawlAction];
        _actionState = kActionStateClimb;
    }
    NSLog(@"PLS WORK PLS");
    
    if (_actionState == kActionStateClimb) {
        [self.currentSuperpower climb:self: direction];
    }
    
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;
    
}

-(void)update:(ccTime)dt {
    NSLog(@"captain updating");
    if (_actionState != kActionStateIdle){
    _desiredPosition = ccpAdd(position_, ccpMult(_velocity, dt));
    }

}

//-(void) setUpright: (Boolean) wantUpright{
//    if (wantUpright && !self.upright){
//        float32 angle = 1 * CC_DEGREES_TO_RADIANS(90);
//        self.body->SetTransform(self.body->GetPosition(), angle );
//        self.upright = true;
//    }
//    else if (!wantUpright && self.upright){
//        float32 angle2 = 1 * CC_DEGREES_TO_RADIANS(90);
//        self.body->SetTransform(self.body->GetPosition(), angle2);
//        self.upright = false;
//    }
//}

-(void) dealloc {
    
}

@end
