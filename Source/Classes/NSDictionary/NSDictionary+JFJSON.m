// NSDictionary+JFJSON.m
// Pods
//
// Created by sheldon on 2018/9/10.
//

#import "NSDictionary+JFJSON.h"

@implementation NSDictionary (JFJSON)
- (NSString *)mzd_JSONString
{
    if (!self) {
        return nil;
    }

    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];

    if (error) {
        NSException *e = [NSException exceptionWithName:@"JSONParser Error" reason:error.localizedDescription userInfo:nil];
        [e raise];
    }

    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end