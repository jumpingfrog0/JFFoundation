// NSDictionary+JFJSON.m
// Pods
//
// Created by sheldon on 2018/9/10.
//

#import "NSDictionary+JFJSON.h"

@implementation NSDictionary (JFJSON)

- (NSString *)jf_JSONString
{
    NSError *error;
    NSData *jsonData;
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return nil;
    }
    @try {
        jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingFragmentsAllowed error:&error];
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        if (error) {
            return nil;
        }
        NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return [ jsonStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
}

- (NSString *)jf_prettyJSONString
{
    NSError *error;
    NSData *jsonData;
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return nil;
    }
    @try {
        jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        if (error) {
            return nil;
        }
        NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return [ jsonStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
}

@end
