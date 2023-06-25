//
//  NSArray+JFSafe.m
//  JFFoundation
//
//  Created by huangdonghong on 2023/6/25.
//

#import "NSArray+JFSafe.h"

extern id JFArraySafeGet(NSArray *array, Class cls, NSInteger index)
{
    id obj = [array jf_objectAtIndex:index];
    if ([obj isKindOfClass:cls]) {
        return obj;
    }
    
    return nil;
}

@implementation NSArray (JFSafe)

- (id)jf_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    
    return nil;
}

- (id)jf_nextObject:(id)object
{
    if (object == nil) {
        return nil;
    }
    
    NSUInteger idx = [self indexOfObject:object];
    return [self jf_objectAtIndex:idx+1];
}

- (id)jf_previousObject:(id)object
{
    if (object == nil) {
        return nil;
    }
    
    NSUInteger idx = [self indexOfObject:object];
    return [self jf_objectAtIndex:idx-1];
}

- (NSUInteger)jf_indexOfObjectWithFilter:(JFFilterArrayBlock)filterBlock
{
    if (!filterBlock) {
        return NSNotFound;
    }
    
    for (NSUInteger i = 0; i < self.count; i++) {
        id obj = [self jf_objectAtIndex:i];
        if (filterBlock(obj)) {
            return i;
        }
    }
    
    return NSNotFound;
}

- (NSString *)jf_stringAtIndex:(NSUInteger)index
{
    return JFArraySafeGet(self, [NSString class], index);
}

- (NSNumber *)jf_numberAtIndex:(NSUInteger)index
{
    return JFArraySafeGet(self, [NSNumber class], index);
}

- (NSArray *)jf_arrayAtIndex:(NSUInteger)index
{
    return JFArraySafeGet(self, [NSArray class], index);
}

@end
