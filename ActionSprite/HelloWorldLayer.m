//
//  HelloWorldLayer.m
//  ActionSprite
//
//  Created by Randall Nickerson on 2/2/13.
//  Copyright Threadbare Games 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init]) ) {
        
        UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tapRecognizer.cancelsTouchesInView = NO;
        [[[CCDirector sharedDirector] view] addGestureRecognizer:tapRecognizer];
		
		
        /* MY STUFF */
        winSize = [[CCDirector sharedDirector] winSize];
        centerScreen = ccp(winSize.width/2, winSize.height/2);
        actionSprite = [ActionSprite spriteWithFile:@"Icon-72.png"];
        [actionSprite setPosition:ccp(200,200)];
        [self addChild:actionSprite];
        
        label = [CCLabelTTF labelWithString:@""
                                   fontName:@"Marker Felt"
                                   fontSize:24];
        
        [label setPosition:centerScreen];
        [self addChild:label];
        
        [self schedule:@selector(updateLabel) interval:0.25];
	}
	return self;
}

- (void)handleTap:(UITapGestureRecognizer *)tapRecognizer
{
    CGPoint location = [tapRecognizer locationInView:tapRecognizer.view];
    location.y = winSize.height - location.y;
    
    switch (actionCounter) {
        case 0:
            CCLOG(@"ADDING ACTION 0");
            [actionSprite addAction:[CCMoveTo actionWithDuration:2.0 position:ccp(824, 200)]];
            break;
            
        case 1:
            CCLOG(@"ADDING ACTION 1");
            [actionSprite addAction:[CCMoveTo actionWithDuration:2.0 position:ccp(824, 568)]];
            break;
            
        case 2:
            CCLOG(@"ADDING ACTION 2");
            [actionSprite addAction:[CCMoveTo actionWithDuration:2.0 position:ccp(200, 568)]];
            break;
            
        case 3:
            CCLOG(@"ADDING ACTION 3");
            [actionSprite addAction:[CCMoveTo actionWithDuration:2.0 position:ccp(200, 200)]];
            break;
            
        case 4:
            CCLOG(@"ADDING ACTION 4 - Immediate action");
            [actionSprite addImediateAction:[CCRotateBy actionWithDuration:1.0 angle:90]];
            break;
    }
    
    if (++actionCounter > 4)
    {
        actionCounter = 0;
    }
}

-(void)updateLabel
{
    [label setString:[NSString stringWithFormat:@"Actions in ActionSprite queue: %d", [actionSprite getQuequeActionCount]]];
}


@end
