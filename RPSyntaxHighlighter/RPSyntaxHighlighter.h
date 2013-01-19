//
//  RPSyntaxHighlighter.h
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 19/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RPSyntaxTheme;

@interface RPSyntaxHighlighter : NSObject

@property (nonatomic, strong) RPSyntaxTheme *theme;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSArray *matchers;
@property (nonatomic, strong) NSArray *scopedMatches;

/**
 Highlights a block of code
 
 This method takes a string representing a block of code in the given language. It then
 runs it through a series of mathchers to identify scopes such as keywords, variables, and
 so on in the block of code. Finally it applies attribues to each of these scopes to 
 highlight the block of code.
 
 @param code the block of code to be highlighted
 @param language the name of the language the code is written in
 
 @return a syntax highlighted `NSAttributedString`
 */
- (NSAttributedString *)highlightCode:(NSString *)code withLanguage:(NSString *)language;

- (NSArray *)findScopedMatches;

@end
