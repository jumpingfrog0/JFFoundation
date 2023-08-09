//
//  NSArray+JFExtension.m
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

#import "NSArray+JFExtension.h"

@implementation NSArray (JFExtension)

- (NSArray *)jf_map:(id(^)(id))map
{
    if (!map) {
        return self;
    }
    
    NSMutableArray *array = [NSMutableArray new];
    for (id obj in self) {
        if (map) {
            [array addObject:map(obj)];
        }
    }
    return array.copy;
}

- (NSArray *)jf_filter:(JFFilterArrayBlock)filter
{
    if (!filter) {
        return self;
    }
    
    NSMutableArray *array = [NSMutableArray new];
    for (id obj in self) {
        if (filter(obj)) {
            [array addObject:obj];
        }
    }
    return array.copy;
}

- (BOOL)jf_containsObject:(id)object compare:(JFCompareBlock)compareBlock
{
    if (!compareBlock) {
        return [self containsObject:object];
    }
    
    for (id obj in self) {
        if (obj == object) {
            return YES;
        }
        
        if (compareBlock(obj, object)) {
            return YES;
        }
    }
    
    return NO;
}

- (void)jf_applay:(void (^)(id obj))operation filter:(JFFilterArrayBlock)filter
{
    if (!filter) {
        return;
    }
    
    for (id obj in self) {
        if (filter(obj)) {
            operation(obj);
            return;
        }
    }
}

- (void)jf_applayAll:(void (^)(id obj))operation filter:(JFFilterArrayBlock)filter
{
    if (!filter) {
        return;
    }
    
    for (id obj in self) {
        if (filter(obj)) {
            operation(obj);
        }
    }
}

- (NSArray *)jf_distinctUnionArray
{
    NSMutableSet *set = [[NSMutableSet alloc] initWithCapacity:self.count];
    NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id obj in self) {
        if (![set containsObject:obj]) {
            [set addObject:obj];
            [resultArray addObject:obj];
        }
    }
    
    return [NSArray arrayWithArray:resultArray];
}

- (NSArray *)jf_distinctUnionArrayWithCompare:(JFCompareBlock)compare
{
    if (!compare) {
        return self;
    }
    
    NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:self.count];

    for (id obj in self) {
        for (id resultObj in resultArray) {
            if (!compare(resultObj, obj)) {
                [resultArray addObject:obj];
            }
        }
    }
    return [NSArray arrayWithArray:resultArray];
}

- (NSArray *)jf_reversed {
    NSMutableArray *result = [NSMutableArray array];
    NSEnumerator *reversed = self.reverseObjectEnumerator;
    id obj;
    while (obj = [reversed nextObject]) {
        [result addObject:obj];
    }
    return [result copy];
}

- (NSString *)jf_stringWithEnum:(NSUInteger)enumVal
{
    if (self.count == 0) {
        return @"";
    }
    
    if (self.count > enumVal) {
        return [self objectAtIndex:enumVal];
    } else {
        return [self objectAtIndex:0];
    }
}

- (NSUInteger)jf_enumFromString:(NSString *)str
{
    return [self jf_enumFromString:str default:0];
}

- (NSUInteger)jf_enumFromString:(NSString *)str default:(NSUInteger)def
{
    NSUInteger n = [self indexOfObject:str];
    if (n == NSNotFound) {
        n = def;
    }
    return n;
}

@end
