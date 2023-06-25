//
//  NSArray+JFExtension.h
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

#import <Foundation/Foundation.h>
#import "NSArray+JFSafe.h"

@interface NSArray (JFExtension)

- (NSArray *)jf_map:(id(^)(id))map;

/// 返回过滤后的数组
/// return YES 会添加到返回列表，
/// return NO 会被过滤掉
- (NSArray *)jf_filter:(JFFilterArrayBlock)filter;

/// 遍历数组，找到符合filter的元素， 执行operation.
/// 执行一次后，不会再遍历其它元素
- (void)jf_applay:(void (^)(id obj))operation filter:(JFFilterArrayBlock)filter;

/// 全部元素都会遍历一次，符合条件的会执行 operation.
- (void)jf_applayAll:(void (^)(id obj))operation filter:(JFFilterArrayBlock)filter;

/// 过滤重复元素，默认执行 isEqual 函数判断
/// 列表顺序不会改变
- (NSArray *)jf_distinctUnionArray;

- (NSArray *)jf_distinctUnionArrayWithCompare:(JFCompareBlock)compareBlock;

- (NSArray *)jf_reversed;

- (NSString *)jf_stringWithEnum:(NSUInteger)enumVal;
- (NSUInteger)jf_enumFromString:(NSString *)str;
- (NSUInteger)jf_enumFromString:(NSString *)str default:(NSUInteger)def;

@end
