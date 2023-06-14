//
//  NSObject+JFExtension.m
//  JFFoundation
//
//  Created by jumpingfrog0 on 2018/08/01.
//
//
//  Copyright (c) 2017 Jumpingfrog0 LLC
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NSObject+JFExtension.h"

@implementation NSObject (JFExtension)
- (id)jf_performSelector:(SEL)sel withObjects:(NSArray *)objects {
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:sel];
    if (signature == nil) {
        return nil;
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = sel;
    
    // setting arguments
    NSInteger paramsCount = signature.numberOfArguments - 2; // except the arguments: self, _cmd
    paramsCount = MIN(paramsCount, objects.count);
    
    for (NSInteger i = 0; i < paramsCount; i++) {
        id object = objects[i];
        if ([object isKindOfClass:[NSNull class]]) continue;
        [invocation setArgument:&object atIndex:i + 2];
    }
    
    [invocation invoke];
    
    const char *returnType = signature.methodReturnType;
    id returnValue;
    
    if (!strcmp(returnType, @encode(void))) {
        // If return type is void, then that is no return value
        returnValue = nil;
    } else if (!strcmp(returnType, @encode(id))) {
        // If return type is object, then set value for variable
        [invocation getReturnValue:&returnValue];
    } else {
        // If return type is basic type(NSInteger, BOOL, Double)
        // get return length
        NSUInteger length = signature.methodReturnLength;
        
        // apply memory according to length
        void *buffer = (void *) malloc(length);
        
        // set value
        [invocation getReturnValue:buffer];
        
        if (!strcmp(returnType, @encode(BOOL))) {
            returnValue = @(*((BOOL *) buffer));
        } else if (!strcmp(returnType, @encode(NSInteger))) {
            returnValue = @(*((NSInteger *) buffer));
        } else {
            returnValue = [NSValue valueWithBytes:buffer objCType:returnType];
        }
    }
    
    return returnValue;
}
@end
