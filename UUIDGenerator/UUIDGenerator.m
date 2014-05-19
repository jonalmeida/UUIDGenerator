//
//  UUIDGenerator.m
//  UUIDGenerator
//
//  Created by Jonathan Almeida on 2014-05-15.
//  Copyright (c) 2014 Jonathan Almeida. All rights reserved.
//

#import "UUIDGenerator.h"

@implementation UUIDGenerator

static NSString const *range = @"abcdef0123456789";
static NSString const *small_range = @"89ab";

- (UInt32) getRandomNum {
    UInt32 num;
    int result = SecRandomCopyBytes(kSecRandomDefault, sizeof(UInt32), (uint8_t*)&num);
    if(result != 0)
        num = arc4random();
    return num;
}

- (unichar) getRandomCharFromString:(NSString *)range {
    int rand_pos = [self getRandomNum] % ([range length]-1);
    return [range characterAtIndex:rand_pos];
}

- (NSString *) uuid4WithCaps:(Boolean)caps hypenated:(Boolean)hypen {
    NSMutableString *result_str = [[NSMutableString alloc] init];

    for(int i = 0; i < 32; i++) {
        if(i == 12) {
            [result_str appendString:@"4"];
            continue;
        }
        if(i == 16) {
            unichar q = [self getRandomCharFromString:(NSString *)small_range];
            [result_str appendString:[NSString stringWithFormat:@"%C", q]];
            continue;
        }
        unichar q = [self getRandomCharFromString:(NSString *)range];
        [result_str appendString:[NSString stringWithFormat:@"%C", q]];
    }

    if(hypen) {
        [result_str insertString:@"-" atIndex:8];
        [result_str insertString:@"-" atIndex:13];
        [result_str insertString:@"-" atIndex:18];
        [result_str insertString:@"-" atIndex:23];
    }

    if(caps)
        result_str = (NSMutableString *)[result_str uppercaseString];

    return result_str;
}

@end
