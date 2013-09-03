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

- (NSDictionary *)attributesForScope:(NSString *)scope
{
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    
    UIColor *foregroundColor = [UIColor colorWithHexString:self.styles[scope][@"color"]];
    UIColor *backgroundColor = [UIColor colorWithHexString:self.styles[scope][@"background"]];
    NSString *fontName = self.styles[scope][@"font"];
	CGFloat fontSize = [self.styles[scope][@"fontSize"] floatValue];
    
    if (foregroundColor) {
        attributes[NSForegroundColorAttributeName] = foregroundColor;
    }
    
    if (backgroundColor) {
        attributes[NSBackgroundColorAttributeName] = backgroundColor;
    }
    
    if (fontName) {
        attributes[NSFontAttributeName] = [UIFont fontWithName:fontName size:fontSize];
    }
    
    return attributes;
}

- (NSDictionary *)defaultStyles
{
    return [self attributesForScope:@"default"];
    
}

@end
