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

@synthesize scopedMatches = _scopedMatches;
@synthesize highlightedCode = _highlightedCode;

+ (NSAttributedString *)highlightCode:(NSString *)code withLanguage:(NSString *)language
{
    RPSyntaxHighlighter *highlighter = [[RPSyntaxHighlighter alloc] init];
    
    highlighter.code = code;
    highlighter.theme = [[RPSyntaxTheme alloc] initWithContentsOfFile:@"tomorrownight"];
    
    return highlighter.highlightedCode;
}

- (NSArray *)matchers
{
    if (_matchers) {
        return _matchers;
    }

    _matchers = [RPSyntaxMatcher matchersWithFile:@"generic"];

    return _matchers;
}

- (NSArray *)scopedMatches
{
    if (_scopedMatches) {
        return _scopedMatches;
    }
    
    NSMutableArray *matches = [[NSMutableArray alloc] init];
    
    [self.matchers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        RPSyntaxMatcher *matcher = (RPSyntaxMatcher *)obj;
        [[matcher matchesInString:self.code] enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
            RPScopedMatch *match = obj;
            [matches addObject:match];
        }];
    }];
    
    _scopedMatches = [NSArray arrayWithArray:matches];
    
    return _scopedMatches;
}

- (NSAttributedString *)highlightedCode
{
    NSMutableAttributedString *highligtedCode = [[NSMutableAttributedString alloc] initWithString:self.code attributes:[self.theme defaultStyles]];
    
    [self.scopedMatches enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        RPScopedMatch *match = obj;
        [match.scopes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSDictionary *textAttributes = [self.theme attributesForScope:obj];
            [highligtedCode addAttributes:textAttributes range:match.range];
        }];
    }];
    
    return highligtedCode;
}

@end
