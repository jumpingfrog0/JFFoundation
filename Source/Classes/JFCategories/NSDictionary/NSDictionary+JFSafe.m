//
//  NSDictionary+JFSafe.m
//  JFFoundation
//
//  Created by huangdonghong on 2023/6/27.
//

#import "NSDictionary+JFSafe.h"

@implementation NSDictionary (JFSafe)

- (NSNumber *)jf_safeNumberForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (![object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSNull class]]) {
        return @(0);
    }
    return object;
}

- (NSNumber *)jf_safeNumberOrNilForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    
    if (![object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return object;
}

- (NSString *)jf_safeStringForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (![object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNull class]]) {
        return @"";
    }
    return object;
}

- (NSString *)jf_safeStringOrNilForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (![object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return object;
}

- (NSArray *)jf_safeArrayForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (![object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSNull class]]) {
        return @[];
    }
    return object;
}

- (NSArray *)jf_safeArrayOrNilForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (![object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return object;
}

- (NSDictionary *)jf_safeDictionaryForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (![object isKindOfClass:[NSDictionary class]] || [object isKindOfClass:[NSNull class]]) {
        return @{};
    }
    return object;
}

- (NSDictionary *)jf_safeDictionaryOrNilForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if (![object isKindOfClass:[NSDictionary class]] || [object isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return object;
}

@end
