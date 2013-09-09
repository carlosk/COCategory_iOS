//
//  NSString+COString.h
//  MyFamework
//
//  Created by carlos on 13-9-7.
//  Copyright (c) 2013年 carlos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CO)

- (BOOL) coContains:(NSString*) str;

- (BOOL) coStartsWith:(NSString*)prefix;

- (BOOL) coEquals:(NSString*) anotherString;

- (BOOL) coEqualsIgnoreCase:(NSString*) anotherString;


- (int) coLastIndexOfString:(NSString*)str;

- (int) coLastIndexOfString:(NSString*)str fromIndex:(int)index;

- (NSString *) coSubstringFromIndex:(int)beginIndex toIndex:(int)endIndex;

- (NSString *) coToLowerCase;

- (NSString *) coToUpperCase;

- (NSString *) coTrim;

- (NSString *) coReplaceAll:(NSString*)origin with:(NSString*)replacement;

- (NSArray *) coSplit:(NSString*) separator;

@end