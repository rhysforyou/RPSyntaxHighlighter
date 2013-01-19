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
    NSDictionary *globalAttributes = @{NSFontAttributeName : [UIFont fontWithName:@"DejaVuSansMono" size:16.0f],
                                       NSForegroundColorAttributeName : [UIColor colorWithHue:0.13 saturation:0.13 brightness:0.92 alpha:1.0]};
    NSMutableAttributedString *highligtedCode = [[NSMutableAttributedString alloc] initWithString:code attributes:globalAttributes];
    
    NSArray *matchers = [RPSyntaxMatcher matchersWithFile:@"javascript"];
    NSMutableDictionary *scopedRanges = [[NSMutableDictionary alloc] init];
    
    [matchers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        RPSyntaxMatcher *matcher = (RPSyntaxMatcher *)obj;
        scopedRanges[matcher.scopes] = [matcher matchesInString:code];
    }];
    
    RPSyntaxTheme *theme = [[RPSyntaxTheme alloc] initWithContentsOfFile:@"tomorrownight"];
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
