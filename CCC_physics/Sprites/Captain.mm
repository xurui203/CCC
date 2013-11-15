

#import "Captain.h"


@implementation Captain



-(id)init {
    NSLog(@"CAPTAIN: INIT");
    if (self = [super init]){
        NSLog(@"init human");
        

        //Set default suerpower to captain
        self.currentSuperpower = [CaptainSP alloc];
        [self.currentSuperpower init];
        

        //Set idle action
        self.idleAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.currentSuperpower.idleAnimation]];
                           
          //Set walk action
        self.walkAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: self.currentSuperpower.walkAnimation]];
                           
        //Set crawl action
        self.crawlAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: self.currentSuperpower.crawlAnimation]];
        
        //to be deleted
        self.superPowerAction =[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: self.currentSuperpower.transformFromAnimation]];
        
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
    
    if (_actionState == kActionStateSuperPower){
        NSLog(@"JUMP EXECUTING");
        [super kangarooJump];
    }
    
    else {//(_actionState != kActionStateIdle){
        NSLog(@"STATE IS NOT IDLE");
        [self stopAllActions];
        [self runAction:_idleAction];
        _actionState = kActionStateIdle;
        _velocity = CGPointZero;
    }
}

//Use this method to reset superpower. This method should be called whenever an icon is clicked from the superpower menu.
- (void)transform:(Superpower*) superpower{
    
    [self stopAllActions];
    [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: self.currentSuperpower.transformFromAnimation]]]; //Transform from current state
    [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: superpower.transformIntoAnimation]]]; //Transform into superpower state
    self.currentSuperpower = superpower;
    if (superpower.name != [NSString stringWithString: (NSString* )@"captain"]){
        _actionState = kActionStateSuperPower;
    }
}

-(void)superPower {
    if (_actionState == kActionStateIdle || _actionState == kActionStateSuperPower){ //|| _actionState == kActionStateWalk) {
        [self stopAllActions];
        [self runAction:_superPowerAction];
        _actionState = kActionStateSuperPower;
        NSLog(@"state changed to superpower");
        
    }
    //_actionState = kActionStateIdle;
    
}


-(void)walk {
    if (_actionState == kActionStateIdle|| _actionState == kActionStateSuperPower || _actionState == kActionStateCrawl) {
        [self stopAllActions];
        [self runAction:_walkAction];
        _actionState = kActionStateWalk;
    }
    
    if (_actionState == kActionStateWalk) {
        _velocity = ccp(2.0, 0);

        [self.currentSuperpower moveRight:self];
    }
}

-(void)crawl {
    if (_actionState == kActionStateIdle|| _actionState == kActionStateSuperPower ||_actionState == kActionStateWalk) {
        [self stopAllActions];
        [self runAction:_crawlAction];
        _actionState = kActionStateCrawl;
        self.position = ccp(self.position.x, self.position.y-200);
    }
    
    if (_actionState == kActionStateCrawl) {
        _velocity = ccp(2.0, 0);
        [super moveRight];
    }
    
}

-(void)update:(ccTime)dt {
    NSLog(@"captain updating");
    if (_actionState == kActionStateWalk | _actionState == kActionStateSuperPower) {
        _desiredPosition = ccpAdd(position_, ccpMult(_velocity, dt));
    }
}
@end
