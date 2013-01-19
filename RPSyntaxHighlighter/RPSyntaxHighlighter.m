//
//  RPSyntaxHighlighter.m
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 19/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "RPSyntaxHighlighter.h"
#import "RPSyntaxMatcher.h"
#import "RPSyntaxTheme.h"
#import "RPScopedMatch.h"

@implementation RPSyntaxHighlighter

- (NSAttributedString *)highlightCode:(NSString *)code withLanguage:(NSString *)language
{
    self.code = code;
    
    RPSyntaxTheme *theme = [[RPSyntaxTheme alloc] initWithContentsOfFile:@"tomorrownight"];
    NSMutableAttributedString *highligtedCode = [[NSMutableAttributedString alloc] initWithString:code attributes:[theme defaultStyles]];
    
    self.matchers = [RPSyntaxMatcher matchersWithFile:@"generic"];
    
    NSArray *matches = [self findScopedMatches];
    
    [matches enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        RPScopedMatch *match = obj;
        [match.scopes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSDictionary *textAttributes = [theme attributesForScope:obj];
            [highligtedCode addAttributes:textAttributes range:match.range];
        }];
    }];
    
    return highligtedCode;
}

- (NSArray *)findScopedMatches
{
    NSMutableArray *matches = [[NSMutableArray alloc] init];
    
    [self.matchers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        RPSyntaxMatcher *matcher = (RPSyntaxMatcher *)obj;
        [[matcher matchesInString:self.code] enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
            RPScopedMatch *match = obj;
            [matches addObject:match];
        }];
    }];
    
    return matches;
}

@end
