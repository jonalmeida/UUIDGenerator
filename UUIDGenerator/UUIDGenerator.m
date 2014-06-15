//
//  UUIDGenerator.m
//  UUIDGenerator
//
//  Created by Jonathan Almeida on 2014-05-15.
//  Copyright (c) 2014 Jonathan Almeida. All rights reserved.
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software. Permission is granted to anyone to
//  use this software for any purpose, including commercial applications, and to
//  alter it and redistribute it freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source
//     distribution.
//

#import "UUIDGenerator.h"

@implementation UUIDGenerator

static NSString const *range = @"abcdef0123456789";
static NSString const *small_range = @"89ab";

+ (UInt32) getRandomNum {
    UInt32 num;
    int result = SecRandomCopyBytes(kSecRandomDefault, sizeof(UInt32), (uint8_t*)&num);
    if(result != 0)
        num = arc4random();
    return num;
}

+ (unichar) getRandomCharFromString:(NSString *)range {
    int rand_pos = [self getRandomNum] % ([range length]-1);
    return [range characterAtIndex:rand_pos];
}

+ (NSString *) uuid4WithCaps:(Boolean)caps hypenated:(Boolean)hypen {
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
