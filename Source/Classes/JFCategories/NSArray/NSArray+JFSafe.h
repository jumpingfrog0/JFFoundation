//
//  NSArray+JFSafe.h
//  JFFoundation
//
//  Created by huangdonghong on 2023/6/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern id JFArraySafeGet(NSArray *array, Class cls, NSInteger index);

@interface NSArray (JFSafe)

typedef BOOL (^JFFilterArrayBlock)(id obj);
typedef BOOL (^JFCompareBlock)(id obj1, id obj2);

/// 检查索引越界
- (id)jf_objectAtIndex:(NSUInteger)index;
- (id)jf_nextObject:(id)object;
- (id)jf_previousObject:(id)object;

/// 返回符合要求的第一个元素的索引
- (NSUInteger)jf_indexOfObjectWithFilter:(JFFilterArrayBlock)filterBlock;

- (NSString *)jf_stringAtIndex:(NSUInteger)index;
- (NSNumber *)jf_numberAtIndex:(NSUInteger)index;
- (NSArray *)jf_arrayAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
