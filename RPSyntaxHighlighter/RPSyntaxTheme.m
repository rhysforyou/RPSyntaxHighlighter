//
//  RPSyntaxColorScheme.m
//  RPSyntaxHighlighter
//
//  Created by Rhys Powell on 19/01/13.
//  Copyright (c) 2013 Rhys Powell. All rights reserved.
//

#import "RPSyntaxTheme.h"
#import "UIColor+RPSyntaxAdditions.h"

@interface RPSyntaxTheme ()

@property (nonatomic, strong) NSDictionary *styles;

@end

@implementation RPSyntaxTheme

- (instancetype)initWithContentsOfFile:(NSString *)filename
{
    if (self = [super init]) {
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:filename ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
        
        NSError *error = nil;
        self.styles = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            NSLog(@"[RPSyntaxHighlighter] Error loading theme JSON: %@", error.localizedDescription);
        }
    }
    
    return self;
}

- (void)styleString:(NSMutableAttributedString *)string atRanges:(NSSet *)ranges forStyle:(NSString *)styleName
{
    NSDictionary *style = self.styles[styleName];
    
    if (!style) {
        return;
    }
    
    UIColor *color = [UIColor colorWithHexString:style[@"color"]];
    
    for (NSValue *value in ranges) {
        NSRange range = [value rangeValue];
        [string addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
}

- (NSDictionary *)defaultStyles
{
  return @{NSForegroundColorAttributeName : [UIColor colorWithHexString:self.styles[@"default"][@"color"]],
           NSBackgroundColorAttributeName : [UIColor colorWithHexString:self.styles[@"default"][@"background"]],
           NSFontAttributeName : [UIFont fontWithName:self.styles[@"default"][@"font"] size:[self.styles[@"default"][@"fontSize"] floatValue]]};
    
}

@end
