//
//  NSMutableArray+JFExtension.h
//  JFFoundation
//
//  Created by huangdonghong on 2023/6/25.
//

#import <Foundation/Foundation.h>
#import "NSArray+JFSafe.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (JFExtension)

/*
 * 删除符合要求的第一个对象
 * return YES: 找到并删除成功
 * return NO: 找不到
 */
- (BOOL)jf_removeObjectWithFilter:(JFFilterArrayBlock)filterBlock;

/*
 * 删除全部符号要求的对象
 */
- (BOOL)jf_removeAllObjectWithFilter:(JFFilterArrayBlock)filterBlock;

@end

NS_ASSUME_NONNULL_END
