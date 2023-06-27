//
//  NSDictionary+JFSafe.h
//  JFFoundation
//
//  Created by huangdonghong on 2023/6/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (JFSafe)

- (NSNumber *)bl_safeNumberForKey:(NSString *)key;
- (NSNumber *)bl_safeNumberOrNilForKey:(NSString *)key;

- (NSString *)bl_safeStringForKey:(NSString *)key;
- (NSString *)bl_safeStringOrNilForKey:(NSString *)key;

- (NSArray *)bl_safeArrayForKey:(NSString *)key;
- (NSArray *)jf_safeArrayOrNilForKey:(NSString *)key;

- (NSDictionary *)bl_safeDictionaryForKey:(NSString *)key;
- (NSDictionary *)jf_safeDictionaryOrNilForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
