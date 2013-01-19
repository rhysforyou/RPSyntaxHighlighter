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

@implementation RPSyntaxHighlighter

+ (NSAttributedString *)highlightCode:(NSString *)code withLanguage:(NSString *)language
{
    RPSyntaxTheme *theme = [[RPSyntaxTheme alloc] initWithContentsOfFile:@"tomorrownight"];
    NSMutableAttributedString *highligtedCode = [[NSMutableAttributedString alloc] initWithString:code attributes:[theme defaultStyles]];
    
    NSArray *matchers = [RPSyntaxMatcher matchersWithFile:@"generic"];
    NSMutableDictionary *scopedRanges = [[NSMutableDictionary alloc] init];
    
    [matchers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        RPSyntaxMatcher *matcher = (RPSyntaxMatcher *)obj;
        scopedRanges[matcher.scopes] = [matcher matchesInString:code];
    }];
    
    [scopedRanges enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSArray *scopes = (NSArray *)key;
        NSSet *ranges = (NSSet *)obj;
        
        [scopes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSString *scope = (NSString *)obj;
            [theme styleString:highligtedCode atRanges:ranges forStyle:scope];
        }];
    }];
    
    return highligtedCode;
}

@end
