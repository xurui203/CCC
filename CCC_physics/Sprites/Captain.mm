

#import "Captain.h"


@implementation Captain

@synthesize currentSuperpower, idleAction, walkAction, jumpAction, crawlAction, spAction;
-(id)init {
    CCLOG(@"CAPTAIN: INIT");
    if (self = [super init]){
        
        CCLOG(@"init human");
        
        //Set default superpower to captain
        currentSuperpower = [[CaptainSP alloc] init];
        //        [currentSuperpower init];
        
        
        //        CCLOG(@"Got HERE after loading current superpower!");
        
        //Set idle action
        idleAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: [currentSuperpower getIdleAnimation]]] ;
        
        //Set walk action
        walkAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: [currentSuperpower getWalkAnimation]]];
        
        //Set crawl action
        crawlAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: [currentSuperpower getCrawlAnimation]]] ;
        
        jumpAction = [CCSequence actions:[CCAnimate actionWithAnimation: [currentSuperpower getJumpAnimation]], nil] ;
        
        spAction = [CCSequence actions:[CCAnimate actionWithAnimation: [currentSuperpower getSpAnimation]], nil];
        
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
    [self restoreHealth:MAX_HEALTH];
}


#define JUMP_TAG 1001

-(void)idle {
    CCLOG(@"IDLING");
    
    CCLOG(@"old position is %f", self.position.x);
    
    if (_actionState == kActionStateBreak){
        NSLog(@"JUMP EXECUTING");
        //        [super kangarooJump];
    }
    
    else {//(_actionState != kActionStateIdle){
        NSLog(@"STATE IS NOT IDLE");
        [self stopAllActions];
        idleAction = [CCSequence actions:[CCAnimate actionWithAnimation:self.currentSuperpower.getIdleAnimation], nil];
        
        [self runAction:idleAction];
        _actionState = kActionStateIdle;
        _velocity = CGPointZero;
    }
}

//Use this method to reset superpower. This method should be called whenever an icon is clicked from the superpower menu.
- (void)transform:(Superpower*) superpower{
    self.executingSpecialAction = FALSE;
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

-(void)specialAction {
    if (!self.currentSuperpower.canSP) return;
    if (_actionState != kActionStateSpecialAction){
        [self stopAllActions];
        if (self.isCrawling){
            [self changeToStandFixture];
        }
        spAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getSpAnimation]], nil];
        [self runAction:spAction];
        _actionState = kActionStateSpecialAction;
        NSLog(@"Captain class: executing special action");
    }
    
    if (_actionState == kActionStateBreak) {
        [self.currentSuperpower breakWall:self];
    }
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;
    self.executingSpecialAction = TRUE;
    
}


-(void)walk {
    self.executingSpecialAction = FALSE;
    if (!self.currentSuperpower.canWalk) return;
    if (_actionState != kActionStateWalk){ //&& [self numberOfRunningActions] ==0){
        [self stopAllActions];
        if (self.isCrawling){
            [self changeToStandFixture];
        }
        walkAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getWalkAnimation]], nil];
        [self runAction:walkAction];
        _actionState = kActionStateWalk;
    }
    
    if (_actionState == kActionStateWalk) {
        [self.currentSuperpower moveRight:self];
    }
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;
    
}

-(void)moveBackwards {
    self.executingSpecialAction = FALSE;
    if (!self.currentSuperpower.canWalk) return;
    if (_actionState != kActionStateWalk){ //&& [self numberOfRunningActions] ==0){
        [self stopAllActions];
        if (self.isCrawling){
            [self changeToStandFixture];
        }
        walkAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getWalkAnimation]], nil];
        [self runAction:walkAction];
        _actionState = kActionStateWalk;
    }
    
    if (_actionState == kActionStateWalk) {
        [self.currentSuperpower moveLeft:self];
    }
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;
    
}

-(void)jump {
    self.executingSpecialAction = FALSE;
    if (!self.currentSuperpower.canJump) return;
    if (_actionState != kActionStateJump){
        [self stopAllActions];
        if (self.isCrawling){
            [self changeToStandFixture];
        }
        jumpAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getJumpAnimation]], nil];
        
        [self runAction:jumpAction];
        _actionState = kActionStateJump;
    }
    
    if (_actionState == kActionStateJump) {
        [self.currentSuperpower jump:self];
    }
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;
}


-(void)crawl {
    self.executingSpecialAction = FALSE;
    if (!self.currentSuperpower.canCrawl) return;
    if (_actionState != kActionStateCrawl){ //&& [self numberOfRunningActions] ==0){
        [self stopAllActions];
        if (!self.isCrawling){
            [self changeToCrawlFixture];
        }
        crawlAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getCrawlAnimation]], nil];
        [self runAction:crawlAction];
        _actionState = kActionStateCrawl;
    }
    if (_actionState == kActionStateCrawl) {
        _velocity = ccp(2.0, 0);
        [self.currentSuperpower crawl:self];
    }
    
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;
    
}

-(void)climb: (b2Vec2) direction {
    self.executingSpecialAction = FALSE;
    if (!self.currentSuperpower.canClimb) return;
    if (_actionState != kActionStateCrawl){ //&& [self numberOfRunningActions] ==0){
        [self stopAllActions];
        _climbAction = [CCSequence actions:[CCAnimate actionWithAnimation: [self.currentSuperpower getCrawlAnimation]], nil];
        [self runAction:crawlAction];
        _actionState = kActionStateClimb;
    }
    
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

-(void) dealloc {
    [super dealloc];
}

@end
