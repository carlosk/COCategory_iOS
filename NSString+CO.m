//
//  NSString+COString.m
//  MyFamework
//
//  Created by carlos on 13-9-7.
//  Copyright (c) 2013年 carlos. All rights reserved.
//

#import "NSString+CO.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (CO)

#define JavaNotFound -1

- (BOOL) coContains:(NSString*) str {
    NSRange range = [self rangeOfString:str];
    return (range.location != NSNotFound);
}

- (BOOL) coStartsWith:(NSString*)prefix {
    return [self hasPrefix:prefix];
}

- (BOOL) coEquals:(NSString*) anotherString {
    return [self isEqual:anotherString];
}

- (BOOL) coEqualsIgnoreCase:(NSString*) anotherString {
    return [[self coToLowerCase] coEquals:[anotherString coToLowerCase]];
}


- (int) coLastIndexOfString:(NSString*)str {
    NSRange range = [self rangeOfString:str options:NSBackwardsSearch];
    if (range.location == NSNotFound) {
        return JavaNotFound;
    }
    return range.location;
}

- (int) coLastIndexOfString:(NSString*)str fromIndex:(int)index {
    NSRange fromRange = NSMakeRange(0, index);
    NSRange range = [self rangeOfString:str options:NSBackwardsSearch range:fromRange];
    if (range.location == NSNotFound) {
        return JavaNotFound;
    }
    return range.location;
}

- (NSString *) coSubstringFromIndex:(int)beginIndex toIndex:(int)endIndex {
    if (endIndex <= beginIndex) {
        return @"";
    }
    NSRange range = NSMakeRange(beginIndex, endIndex - beginIndex);
    return [self substringWithRange:range];
}

- (NSString *) coToLowerCase {
    return [self lowercaseString];
}

- (NSString *) coToUpperCase {
    return [self uppercaseString];
}

- (NSString *) coTrim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *) coReplaceAll:(NSString*)origin with:(NSString*)replacement {
    return [self stringByReplacingOccurrencesOfString:origin withString:replacement];
}

- (NSArray *) coSplit:(NSString*) separator {
    return [self componentsSeparatedByString:separator];
}
//MD5加密
-(NSString *)coMD5{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

#pragma mark verify
//校验手机号码
-(BOOL)coVerifyPhone{

    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^(((15[012356789]{1})|(18[02356789]{1})|(13[0-9]{1})|(14[57]{1}))+[0-9]{8})$" options:NSRegularExpressionCaseInsensitive error:nil];
    
    //    获得所有匹配了表达式的字符串。
    NSArray *array = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    return array.count>0;
}
@end
