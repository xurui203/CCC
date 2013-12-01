//
//  Defines.h
//  CaptainCC
//
//  Created by Ann Niou on 10/28/13.
//
//
#import <CoreGraphics/CoreGraphics.h>
#ifndef CaptainCC_Defines_h
#define CaptainCC_Defines_h

// 1 - convenience measurements
#define SCREEN [[CCDirector sharedDirector] winSize]
#define CENTER ccp(SCREEN.width/2, SCREEN.height/2)
#define CURTIME CACurrentMediaTime()

// 2 - convenience functions
#define random_range(low,high) (arc4random()%(high-low+1))+low
#define frandom (float)arc4random()/UINT64_C(0x100000000)
#define frandom_range(low,high) ((high-low)*frandom)+low


// font sizes

#define kFontScaleHuge 6;
#define kFontScaleLarge 9;
#define kFontScaleMedium 10;
#define kFontScaleSmall 12;
#define kFontScaleTiny 14;


//Maze IDs
//To add new maze, define its ID.
# define CAPTAIN_MAZE_ID 1000
# define KL_MAZE_ID 1001
# define GECKO_MAZE_ID 1002
# define RAM_MAZE_ID 1003
# define DOG_MAZE_ID 1003

# define MAIN_ONE_ID 1
# define MAIN_TWO_ID 2

// 3 - enumerations
typedef enum _ActionState {
    kActionStateNone = 0,
    kActionStateIdle,
    //kActionStateSuperPower,
    kActionStateSpecialAction,
    kActionStateWalk,
    kActionStateCrawl,
    kActionStateJump,
    kActionStateFail
} ActionState;

// 4 - structures
typedef struct _BoundingBox {
    CGRect actual;
    CGRect original;
    
} BoundingBox;



#endif
