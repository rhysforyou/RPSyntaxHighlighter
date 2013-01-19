//
//  RPSyntaxHighlighter.m
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 19/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "RPSyntaxHighlighter.h"
#import "RPSyntaxMatcher.h"

@implementation RPSyntaxHighlighter

+ (NSAttributedString *)highlightCode:(NSString *)code withLanguage:(NSString *)language
{
    NSDictionary *globalAttributes = @{NSFontAttributeName : [UIFont fontWithName:@"DejaVuSansMono" size:16.0f],
                                       NSForegroundColorAttributeName : [UIColor colorWithHue:0.13 saturation:0.13 brightness:0.92 alpha:1.0]};
    NSMutableAttributedString *highligtedCode = [[NSMutableAttributedString alloc] initWithString:code attributes:globalAttributes];
    
    NSArray *matchers = [RPSyntaxMatcher matchersWithFile:@"javascript"];
    
    [matchers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        for (NSValue *rangeValue in [(RPSyntaxMatcher *)obj matchesInString:code]) {
            NSRange range = [rangeValue rangeValue];
            [highligtedCode addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:range];
        }
    }];
    
    return highligtedCode;
}

@end
