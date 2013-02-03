//
//  ActionSprite.m
//  ActionSprite
//
//  Created by Randall Nickerson on 2/2/13.
//  Copyright (c) 2013 Threadbare Games. All rights reserved.
//

#import "ActionSprite.h"

@implementation ActionSprite

-(id)initWithFile:(NSString *)filename
{
    if (self = [super initWithFile:filename])
    {
        actionQueue = [[NSMutableArray alloc] init];
        interval = 0.016;
        [self schedule:@selector(runActions) interval:interval];
    }
    return self;
}


/* 
 Adds any non-nil action to the action queue
 to be run in sequence
 */
-(void)addAction:(CCAction *)action
{
    if (action)
    {
        [actionQueue addObject:action];
    }
}

/*
 Runs any non-nil action immediately,
 without adding it to the action queue
 */
-(void)addImediateAction:(CCAction*)action
{
    if (action)
    {
        [self runAction:action];
    }
}

/*
 Set/change the interval time that the scheduled selector
 runs to execute the queued actions
 */
-(void)setInterval:(ccTime)time
{
    // Set the interval to the new time
    interval = time;
    
    // Unschedule the current schedule running the old interval
    [self unschedule:@selector(runActions)];
    
    // Schedule the selector to run on the new interval
    [self schedule:@selector(runActions) interval:interval];
}

/*
 Return the current interval
 */
-(ccTime)getInterval
{
    // longer intervals may produce a delay between action executions
    // default interval is 1/60, or 0.016 (60 FPS) so it is checked once per frame
    return interval;
}

/*
 Return the number of queued actions, 
 including any currently running action
 */
-(int)getQuequeActionCount
{
    // if an action is running then include it in the count
    return ([self numberOfRunningActions])
        ? actionQueue.count + 1
        : actionQueue.count;
}

/*
 Scheduled selector that executes actions in the
 action queue in sequence
 */
-(void)runActions
{
    if (![self numberOfRunningActions])
    {
        if (actionQueue.count > 0)
        {
            id action = [actionQueue objectAtIndex:0];
            [self runAction:[action copy]];
            [actionQueue removeObjectAtIndex:0];
        }
    }
}

@end
