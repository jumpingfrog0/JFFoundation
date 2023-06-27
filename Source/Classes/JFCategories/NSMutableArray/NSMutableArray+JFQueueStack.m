//
//  NSMutableArray+JFQueueStack.m
//  JFFoundation
//
//  Created by huangdonghong on 2023/6/27.
//

#import "NSMutableArray+JFQueueStack.h"

@implementation NSMutableArray (JFQueueStack)

- (id)jf_dequeue
{
    if (self.count > 0) {
        id headObject = [self objectAtIndex:0];
        if (headObject != nil) {
            [self removeObjectAtIndex:0];
        }
        
        return headObject;
    }
    return nil;
}

- (void)jf_enqueue:(id)anObject
{
    if (anObject) {
        [self addObject:anObject];
    }
}

- (id)jf_queueFront
{
    return self.firstObject;
}

- (id)jf_stackPop
{
    id lastObject = [self lastObject];
    if (lastObject) {
        [self removeLastObject];
    }

    return lastObject;
}

- (void)jf_stackPush:(id)obj
{
    if (obj) {
        [self addObject:obj];
    }
}

@end
