//
//  NSString+JFExtension.m
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

#import "NSString+JFExtension.h"
#import "JFFloatUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (JFExtension)

+ (NSString *)jf_parseString:(NSString*)string separatorIndexs:(NSArray *)indexs separator:(NSString *)separator {
    if (!string) return nil;
    NSMutableString *mStr = [NSMutableString stringWithString:[string stringByReplacingOccurrencesOfString:separator withString:@""]];
    [indexs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger index = [obj integerValue];
        if (mStr.length > index) [mStr insertString:separator atIndex:index];
    }];
    return  mStr;
}

- (CGSize)jf_safeSizeWithFont:(UIFont *)font {
    return [self jf_safeSizeWithFont:font
                   constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                       lineBreakMode:NSLineBreakByCharWrapping];
}

- (CGSize)jf_safeSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
    return [self jf_safeSizeWithFont:font
                   constrainedToSize:size
                       lineBreakMode:NSLineBreakByCharWrapping];
}

- (CGSize)jf_safeSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = lineBreakMode;
    
    NSDictionary *attributes = @{NSFontAttributeName:font};
    if (lineBreakMode != NSLineBreakByCharWrapping) {
        attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    }
    CGRect boundingRect = [self boundingRectWithSize:size
                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:attributes
                                             context:nil];
    if (!JF_IS_NORMAL(boundingRect.size.width) || !JF_IS_NORMAL(boundingRect.size.height)) {
        return CGSizeMake(0, 0);
    }
    return CGSizeMake(ceilf(boundingRect.size.width), ceilf(boundingRect.size.height));
}

#pragma mark - 星座

+ (NSString *)jf_zodiacSignWithMonth:(NSInteger)m day:(NSInteger)d {
    NSString *zodiacString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *zodiacFormat = @"102123444543";
    
    if (m<1||m>12||d<1||d>31){
        return @"";
    }
    
    if(m==2 && d>29) {
        return @"";
    } else if (m==4 || m==6 || m==9 || m==11) {
        if (d>30) {
            return @"";
        }
    }
    
    NSString *result = [NSString stringWithFormat:@"%@座",[zodiacString substringWithRange:NSMakeRange(m*2-(d < [[zodiacFormat substringWithRange:NSMakeRange((m-1), 1)] intValue] - (-19))*2,2)]];
    
    return result;
}

+ (NSString *)jf_zodiacSignWithTs:(NSTimeInterval)ts {
    NSDate *today = [NSDate dateWithTimeIntervalSince1970:ts];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [gregorian components:(NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:today];
    NSInteger month = [weekdayComponents month];
    NSInteger day = [weekdayComponents day];
    return [NSString jf_zodiacSignWithMonth:month day:day];
}

#pragma mark - Regular

- (NSArray *)jf_subStringByRegular:(NSString *)regular {
    NSRange range = [self rangeOfString:regular options:NSRegularExpressionSearch];
    if (range.length == 0 || range.location == NSNotFound) {
        return nil;
    }
    
    NSMutableArray *array = [NSMutableArray array];
    while (range.length != 0 && range.location != NSNotFound) {
        NSString *subStr = [self substringWithRange:range];
        [array addObject:subStr];
        
        NSRange subRange = NSMakeRange(range.location + range.length, self.length - range.location - range.length);
        range = [self rangeOfString:regular options:NSRegularExpressionSearch range:subRange];
    }
    return array;
}

#pragma mark -

- (NSInteger)jf_realLength {
    __block NSInteger length = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        length++;
    }];
    return length;
}

- (NSString *)jf_trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)jf_stringByTruncatingToLength:(NSUInteger)length
{
    return [self jf_stringByTruncatingToLength:length ellipsis:YES];
}

- (NSString *)jf_stringByTruncatingToLength:(NSUInteger)length ellipsis:(BOOL)ellipsis
{
    NSString *string = [self copy];
    if (length == 0 || string.length == 0) {
        return @"";
    }
    
    if (string.length > length) {
        NSRange rangeIndex = [string rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, length)];
        string = [string substringWithRange:rangeIndex];
        if (ellipsis) {
            return [string stringByAppendingString:@"..."];
        }
    }
    
    return string;
}

- (NSString *)jf_filterXMLEscapeChar
{
    NSString *temp = [self stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    temp = [temp stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    temp = [temp stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    temp = [temp stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    temp = [temp stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    return temp;
}

@end
