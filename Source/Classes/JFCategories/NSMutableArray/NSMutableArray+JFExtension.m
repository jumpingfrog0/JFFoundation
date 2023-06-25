//
//  NSMutableArray+JFExtension.m
//  JFFoundation
//
//  Created by huangdonghong on 2023/6/25.
//

#import "NSMutableArray+JFExtension.h"

@implementation NSMutableArray (JFExtension)

- (BOOL)jf_removeObjectWithFilter:(JFFilterArrayBlock)filterBlock
{
    NSAssert(filterBlock, @"block must not nil");
    
    for (NSUInteger i = 0 ; i < self.count; i++) {
        id obj = [self jf_objectAtIndex:i];
        if (filterBlock(obj)) {
            [self removeObjectAtIndex:i];
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)jf_removeAllObjectWithFilter:(JFFilterArrayBlock)filterBlock
{
    NSAssert(filterBlock, @"block must not nil");
    
    NSMutableIndexSet *indexSet = nil;
    
    for (NSUInteger i = 0 ; i < self.count; i++) {
        id obj = [self jf_objectAtIndex:i];
        if (filterBlock(obj)) {
            if (indexSet == nil) {
                indexSet = [[NSMutableIndexSet alloc] init];
            }
            [indexSet addIndex:i];
        }
    }
    
    if (indexSet.count > 0) {
        [self removeObjectsAtIndexes:indexSet];
        return YES;
    }
    
    return NO;
}

@end
