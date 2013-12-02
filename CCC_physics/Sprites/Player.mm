
#import "Player.h"
#import "Constants.h"
#import "ContactListener.h"
@implementation Player
@synthesize body;
@synthesize health, inLearningModules;

- (id) init {
	if ((self = [super init])) {
		type = kGameObjectPlayer;
        health = 11;
        self.isDead = NO;
        self.inLearningModules = NO;
        self.levelComplete = NO;
	}
	return self;
}


//HEALTH
-(bool) isDead {
    return health <= 0;
}

-(void) restoreHealth:(float)amount
{
    health = MAX(health + amount, MAX_HEALTH);
}

-(void) updateHealth {
  
    health += 5;
    if (health > MAX_HEALTH) {
        health = MAX_HEALTH;
    }
   // CCLOG(@"updating health");
   // CCLOG(@"%d", health);
}

-(void) decreaseHealth {
    
    health -= 5;
    if (health <= 0) {
        self.isDead = YES;
//        [SceneManager goGameOverLayer];
    }
    // CCLOG(@"updating health");
    // CCLOG(@"%d", health);
}

-(void)startContact {
    contactingGameOver = true;
}

-(void) createBox2dObject:(b2World*)world {
    b2BodyDef playerBodyDef;
	playerBodyDef.type = b2_dynamicBody;
	playerBodyDef.position.Set(self.position.x/PTM_RATIO, self.position.y/PTM_RATIO);
	playerBodyDef.userData = self;
	playerBodyDef.fixedRotation = true;
	
	body = world->CreateBody(&playerBodyDef);
	
    // Standing Fixture Initialization
	b2PolygonShape polygonShape;
    polygonShape.SetAsBox(1.0f, 1.0f);
	//polygonShape.m_radius = 0.7;
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &polygonShape;
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 1.0f;
	fixtureDef.restitution =  0.0f;
	body->CreateFixture(&fixtureDef);
    
    // Crawling Fixture Initialization
    b2PolygonShape crawlPolygonShape;
    crawlPolygonShape.SetAsBox(1.0f, 0.5f);
    // radius changes?
    b2FixtureDef crawlFixtureDef;
    crawlFixtureDef.shape = &crawlPolygonShape;
    crawlFixtureDef.density = 1.0f;
    crawlFixtureDef.friction = 1.0f;
    crawlFixtureDef.restitution = 0.0f;
    crawlFixtureDef.isSensor = true; // CRAWLING FIXTURE STARTS OUT AS A SENSOR
    body->CreateFixture(&crawlFixtureDef);
    
    NSLog(@"Player created in world");
}

//-(void) moveRight {
//    b2Vec2 impulse = b2Vec2(1.0f, 0.0f);
//    body->ApplyLinearImpulse(impulse, body->GetWorldCenter());
//    body->SetLinearVelocity(b2Vec2(6.5, 0));
//
//}

-(void) crawling {
    b2Vec2 impulse = b2Vec2(1.0f, 0.0f);
    body->ApplyLinearImpulse(impulse, body->GetWorldCenter());
    body->SetLinearVelocity(b2Vec2(6.5, 0));
    
}




@end
