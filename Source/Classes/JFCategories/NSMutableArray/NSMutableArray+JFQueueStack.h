//
//  NSMutableArray+JFQueueStack.h
//  JFFoundation
//
//  Created by huangdonghong on 2023/6/27.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (JFQueueStack)

- (id)jf_dequeue;

- (void)jf_enqueue:(id)anObject;

- (id)jf_queueFront;

- (id)jf_stackPop;

- (void)jf_stackPush:(id)obj;

@end

