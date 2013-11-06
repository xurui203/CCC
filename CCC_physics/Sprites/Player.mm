
#import "Player.h"
#import "Constants.h"

@implementation Player
@synthesize body;

- (id) init {
	if ((self = [super init])) {
		type = kGameObjectPlayer;
	}
	return self;
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
	
	b2CircleShape circleShape;
	circleShape.m_radius = 0.7;
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &circleShape;
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 1.0f;
	fixtureDef.restitution =  0.0f;
	body->CreateFixture(&fixtureDef);
    
    NSLog(@"Player created in world");
}

-(void) moveRight {
    b2Vec2 impulse = b2Vec2(1.0f, 0.0f);
    body->ApplyLinearImpulse(impulse, body->GetWorldCenter());
    body->SetLinearVelocity(b2Vec2(6.5, 0));

}

-(void) crawling {
    b2Vec2 impulse = b2Vec2(1.0f, 0.0f);
    body->ApplyLinearImpulse(impulse, body->GetWorldCenter());
    body->SetLinearVelocity(b2Vec2(6.5, 0));
    
}

-(void) kangarooJump {
    b2Vec2 impulse = b2Vec2(4.0f, 15.0f);
    body->ApplyLinearImpulse(impulse, body->GetWorldCenter());		    
}



@end
