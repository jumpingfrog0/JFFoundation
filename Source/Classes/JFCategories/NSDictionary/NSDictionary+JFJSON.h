// NSDictionary+JFJSON.h
// Pods
//
// Created by sheldon on 2018/9/10.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JFJSON)
/**
 *  通过 JSON object 初始化字符串
 *
 *  @return 序列化后的 json string，转换失败返回 nil
 */
- (NSString *)jf_JSONString;
@end
