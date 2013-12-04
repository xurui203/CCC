
#import "Player.h"
#import "Constants.h"
#import "ContactListener.h"
@implementation Player
@synthesize body;
@synthesize health, inLearningModules, breakingWall;

- (id) init {
	if ((self = [super init])) {
		type = kGameObjectPlayer;
        health = 11;
        self.isDead = NO;
        self.inLearningModules = NO;
        self.levelComplete = NO;
        self.breakingWall = NO;
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
    b2PolygonShape polygonShape;
    polygonShape.SetAsBox(1.0f, 0.5f);
    //polygonShape.m_radius = 0.7;
//	b2FixtureDef fixtureDef;
	fixtureDef.shape = &polygonShape;
	fixtureDef.density = 1.0f;
	fixtureDef.friction = 1.0f;
	fixtureDef.restitution =  0.0f;
    fixtureDef.isSensor = false;
	body->CreateFixture(&fixtureDef);
    NSLog(@"Player created in world");
}


-(void) changeToCrawlFixture {
    b2PolygonShape crawlPolygonShape;
    crawlPolygonShape.SetAsBox(1.0f, 0.0001f);
    crawlPolygonShape.m_radius = 0.01;
    
//    b2Vec2 move = b2Vec2(0.0f, 2.0f);
//    for(int32 i=0;i<crawlPolygonShape.m_vertexCount;i++)
//    {
//        crawlPolygonShape.m_vertices[i]+=move;
//    }
//    crawlPolygonShape.m_centroid+=move;
    b2FixtureDef crawlDef;
    crawlDef.shape = &crawlPolygonShape;
    crawlDef.density = 1.0f;
    crawlDef.friction = 1.0f;
    crawlDef.restitution = 0.0f;
    crawlDef.isSensor = false;
    
    for (b2Fixture *f = body->GetFixtureList(); f;){
        b2Fixture* fixtureToDestroy = f;
        f = f->GetNext();
        body->DestroyFixture(fixtureToDestroy);
    }

    body->CreateFixture(&crawlDef);
    self.isCrawling = true;
}

-(void) changeToStandFixture {
    b2PolygonShape standPolygonShape;
    standPolygonShape.SetAsBox(1.0f, 0.5f);
    
//    b2Vec2 move = b2Vec2(0.0f, 1.0f);
//    for(int32 i=0;i<standPolygonShape.m_vertexCount;i++)
//    {
//        standPolygonShape.m_vertices[i]+=move;
//    }
//    standPolygonShape.m_centroid+=move;

    
    b2FixtureDef standDef;
    standDef.shape = &standPolygonShape;
    standDef.density = 1.0f;
    standDef.friction = 1.0f;
    standDef.restitution = 0.0f;
    standDef.isSensor = false;
    
    for (b2Fixture *f = body->GetFixtureList(); f;){
        b2Fixture* fixtureToDestroy = f;
        f = f->GetNext();
        body->DestroyFixture(fixtureToDestroy);
    }
    body->CreateFixture(&standDef);
    self.isCrawling = false;

}




@end
