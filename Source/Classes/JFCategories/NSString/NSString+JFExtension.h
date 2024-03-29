//
//  NSString+JFExtension.h
//  JFFoundation
//
//  Created by jumpingfrog0 on 2017/07/27.
//
//
//  Copyright (c) 2017 Jumpingfrog0 LLC
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (JFExtension)

+ (NSString *)jf_parseString:(NSString*)string separatorIndexs:(NSArray *)indexs separator:(NSString *)separator;

- (CGSize)jf_safeSizeWithFont:(UIFont *)font;
- (CGSize)jf_safeSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGSize)jf_safeSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

+ (NSString *)jf_zodiacSignWithMonth:(NSInteger)month day:(NSInteger)day;
+ (NSString *)jf_zodiacSignWithTs:(NSTimeInterval)ts;

/**
 * 根据一个正则表达式在字符串中查找符合条件的子串
 *
 * @param regular 正则表达式
 */
- (NSMutableArray *)jf_subStringByRegular:(NSString *)regular;

/**
 * 计算字符串真实长度，一个emoji长度为1
 */
- (NSInteger)jf_realLength;

- (NSString *)jf_trim;


/// 截取字符串，末尾会加省略号
/// - Parameter length: 长度
- (NSString *)jf_stringByTruncatingToLength:(NSUInteger)length;


/// 截取字符串，末尾是否加省略号
/// - Parameters:
///   - length: 长度
///   - ellipsis: 是否加省略号
- (NSString *)jf_stringByTruncatingToLength:(NSUInteger)length ellipsis:(BOOL)ellipsis;

- (NSString *)jf_filterXMLEscapeChar;

@end
