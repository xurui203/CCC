

#import "Captain.h"


@implementation Captain



-(id)init {
    NSLog(@"CAPTAIN: INIT");
    if (self = [super init]){

        NSLog(@"init human");

        //Set default superpower to captain
        self.currentSuperpower = [CaptainSP alloc];
        [self.currentSuperpower init];
        
        NSLog(@"Got HERE after loading current superpower!");
        
        //Set idle action
        self.idleAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.currentSuperpower.idleAnimation]];
                           
          //Set walk action
        self.walkAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: self.currentSuperpower.walkAnimation]];
                           
        //Set crawl action
        self.crawlAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: self.currentSuperpower.crawlAnimation]];
        
        self.jumpAction = [CCSequence actions:[CCAnimate actionWithAnimation:self.currentSuperpower.jumpAnimation], nil];
        
        self.specialPowerAction = [CCSequence actions:[CCAnimate actionWithAnimation:self.currentSuperpower.spAnimation], nil];
        
        //Set some initial values for the hero’s attributes, including the measurements from the center of the sprite to the sides and bottom
        self.centerToBottom = 39.0;
        self.centerToSides = 29.0;
        self.hitPoints = 100.0;
        self.damage = 20.0;
        self.walkSpeed = 80;
        
    }
    NSLog(@"captain init but without frame");
    return self;
}




#define JUMP_TAG 1001

-(void)idle {
    NSLog(@"IDLING");
    
    NSLog(@"old position is %f", self.position.x);
    
    if (_actionState == kActionStateSpecialAction){
        NSLog(@"JUMP EXECUTING");
        [super kangarooJump];
    }
    
    else {//(_actionState != kActionStateIdle){
        NSLog(@"STATE IS NOT IDLE");
        [self stopAllActions];
        _idleAction = [CCSequence actions:[CCAnimate actionWithAnimation:self.currentSuperpower.idleAnimation], nil];

        [self runAction:_idleAction];
        _actionState = kActionStateIdle;
        _velocity = CGPointZero;
    }
}

//Use this method to reset superpower. This method should be called whenever an icon is clicked from the superpower menu.
- (void)transform:(Superpower*) superpower{
    if ([self numberOfRunningActions] ==0){
    [self stopAllActions];
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    [self runAction:[CCSequence actions:[CCAnimate actionWithAnimation: self.currentSuperpower.transformFromAnimation], nil]]; //Transform from current state
    
    [self runAction:[CCSequence actions:[CCAnimate actionWithAnimation: superpower.transformIntoAnimation], nil]]; //Transform into superpower state
    self.currentSuperpower = superpower;
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);

    _actionState = kActionStateIdle;
    }
}

-(void)specialAction {
    if (_actionState!= kActionStateSpecialAction){ //|| _actionState == kActionStateWalk) {
        [self stopAllActions];
        [self runAction:_specialPowerAction];
        _actionState = kActionStateSpecialAction;
        NSLog(@"state changed to superpower");
        
    }
    //_actionState = kActionStateIdle;
    
}


-(void)walk {
    if (!self.currentSuperpower.canWalk) return;
    if (_actionState != kActionStateWalk && [self numberOfRunningActions] ==0){
        [self stopAllActions];
        _walkAction = [CCSequence actions:[CCAnimate actionWithAnimation:self.currentSuperpower.walkAnimation], nil];
        [self runAction:_walkAction];
        _actionState = kActionStateWalk;
    }
    
    if (_actionState == kActionStateWalk) {
        [self.currentSuperpower moveRight:self];
    }
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;

}

-(void)jump {
    if (!self.currentSuperpower.canJump) return;
    if (_actionState != kActionStateJump){
        [self stopAllActions];
        _jumpAction = [CCSequence actions:[CCAnimate actionWithAnimation:self.currentSuperpower.jumpAnimation], nil];

        [self runAction:_jumpAction];
        _actionState = kActionStateJump;
    }
    
    if (_actionState == kActionStateJump) {
        [self.currentSuperpower jump:self];
    }
    NSLog(@"Current superpower is: %@", self.currentSuperpower.name);
    _actionState = kActionStateIdle;

}
-(void)crawl {
    if (!self.currentSuperpower.canCrawl) return;

    if (_actionState != kActionStateCrawl && [self numberOfRunningActions] ==0){
        [self stopAllActions];
        [self runAction:_crawlAction];
        _actionState = kActionStateCrawl;
    }
    
    if (_actionState == kActionStateCrawl) {
        _velocity = ccp(2.0, 0);
        [self.currentSuperpower crawl:self];
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
@end
