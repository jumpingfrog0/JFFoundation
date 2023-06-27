//
//  NSMutableArray+JFSafe.h
//  JFFoundation
//
//  Created by huangdonghong on 2023/6/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (JFSafe)

- (void)jf_safeAddObject:(id)obj;
- (void)jf_safeRemoveFirstObject;
- (void)jf_safeRemoveObjectAtIndex:(NSUInteger)index;
- (void)jf_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)jf_safeInsertObject:(id)anObject atIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
