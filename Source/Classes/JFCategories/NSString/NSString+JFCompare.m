//  NSString+JFCompare.m
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

#import "NSString+JFCompare.h"

@implementation NSString (JFCompare)
- (BOOL)jf_isLargerThan:(NSString *)str {
    NSComparisonResult result = [self compare:str];
    return (result == NSOrderedDescending);
}

- (BOOL)jf_isLargerOrEqualThan:(NSString *)str {
    NSComparisonResult result = [self compare:str];
    return (result != NSOrderedAscending);
}

- (NSComparisonResult)bl_compareVersion:(NSString *)version
{
    NSArray *version1 = [self componentsSeparatedByString:@"."];
    NSArray *version2 = [version componentsSeparatedByString:@"."];
    for (int i = 0; i < version1.count || i < version2.count; i++) {
        NSInteger value1 = 0;
        NSInteger value2 = 0;
        if (i < version1.count) {
            value1 = [version1[i] integerValue];
        }
        if (i < version2.count) {
            value2 = [version2[i] integerValue];
        }
        if (value1  == value2) {
            continue;
        }
        else {
            if (value1 > value2) {
                return NSOrderedDescending;
            }
            else {
                return NSOrderedAscending;
            }
        }
    }
    return NSOrderedSame;
}

@end
