// NSDictionary+JFJSON.h
// Pods
//
// Created by sheldon on 2018/9/10.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JFJSON)

/// 字典转json string
- (NSString *)jf_JSONString;

/// 字典转json string
/// 使用空白和缩进使输出更具可读性的写入选项。输入时有\n来换行，容易阅读，但是如果与后台交互使用这样，可能会出现问题。
/// 一般用于日志输出或可视化
- (NSString *)jf_prettyJSONString;

@end
