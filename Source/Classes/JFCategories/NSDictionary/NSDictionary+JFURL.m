//
//  NSDictionary+JFURL.m
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

#import "NSDictionary+JFURL.h"

@implementation NSDictionary (JFURL)

- (NSString *)jf_joinURLQueries
{
    if (self.allKeys.count > 0) {
        NSEnumerator *keyEnumerator = [self keyEnumerator];
        id key                      = [keyEnumerator nextObject];
        NSMutableString *query      = [NSMutableString stringWithFormat:@"%@=%@", key, self[key]];
        while ((key = [keyEnumerator nextObject]) != nil) {
            [query appendFormat:@"&%@=%@", key, self[key]];
        }
        return query;
    }
    return nil;
}

+ (NSDictionary *)jf_paramsForURLString:(NSString *)URLString
{
    NSRange questionMarkRange = [URLString rangeOfString:@"?"];
    if (questionMarkRange.location != NSNotFound) {
        NSString *paramsString = [URLString substringFromIndex:questionMarkRange.location + 1];
        NSArray *paramsArray = [paramsString componentsSeparatedByString:@"&"];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        for (NSString *paramString in paramsArray) {
            NSArray *keyValues = [paramString componentsSeparatedByString:@"="];
            if (keyValues.count == 2) {
                [params setObject:[keyValues[1] stringByRemovingPercentEncoding]
                           forKey:[keyValues[0] stringByRemovingPercentEncoding]];
            }
        }
        return [params copy];
    } else {
        return nil;
    }
}

@end
