//
//  NSString+COString.m
//  MyFamework
//
//  Created by carlos on 13-9-7.
//  Copyright (c) 2013年 carlos. All rights reserved.
//

#import "NSString+CO.h"

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
    return [self isEqualToString:anotherString];
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

@end