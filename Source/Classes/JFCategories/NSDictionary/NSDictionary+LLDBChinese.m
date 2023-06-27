//
//  NSDictionary+LLDBChinese.m
//  JFFoundation
//
//  Created by huangdonghong on 2023/6/27.
//

#import "NSDictionary+LLDBChinese.h"

@implementation NSDictionary (LLDBChinese)

/// 使用po打印输出中文
- (NSString *)debugDescription
{
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return [super debugDescription];
    }
    
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonStr;
}

@end
