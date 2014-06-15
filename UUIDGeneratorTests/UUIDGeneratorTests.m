//
//  UUIDGeneratorTests.m
//  UUIDGeneratorTests
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

#import <XCTest/XCTest.h>
#import "UUIDGenerator.h"

@interface UUIDGeneratorTests : XCTestCase

@end

@implementation UUIDGeneratorTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testUUID4
{
    NSLog(@"UUID4: %@", [UUIDGenerator uuid4WithCaps:false hypenated:false]);
    NSLog(@"UUID4: %@", [UUIDGenerator uuid4WithCaps:true hypenated:false]);
    NSLog(@"UUID4: %@", [UUIDGenerator uuid4WithCaps:false hypenated:true]);
    NSLog(@"UUID4: %@", [UUIDGenerator uuid4WithCaps:true hypenated:true]);
}

- (void)testCorrectUUIDFormat
{
    NSString *sample_uuid = [UUIDGenerator uuid4WithCaps:false hypenated:true];
    NSString *pattern = @"[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}";
    NSRange searchRange = NSMakeRange(0, [sample_uuid length]);
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *matches = [regex matchesInString:sample_uuid options:0 range:searchRange];
    
    [matches count];
    for (NSTextCheckingResult* match in matches) {
        NSString* matchText = [sample_uuid substringWithRange:[match range]];
        NSLog(@"match: %@", matchText);
        NSRange group1 = [match rangeAtIndex:0];
        NSLog(@"group1: %@", [sample_uuid substringWithRange:group1]);
    }
    
    NSLog(@"Our UUID, %@", sample_uuid);
    NSLog(@"Our UUID length, %lu", (unsigned long)[sample_uuid length]);
    
    XCTAssertEqual([matches count], 1, @"UUID generated doesn't match the type 4 UUID RFC");
}

- (void)testCorrectUUIDFormat2
{
    NSString *sample_uuid = [UUIDGenerator uuid4WithCaps:true hypenated:true];
    NSString *pattern = @"[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}";
    NSRange searchRange = NSMakeRange(0, [sample_uuid length]);
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *matches = [regex matchesInString:sample_uuid options:0 range:searchRange];
    
    [matches count];
    for (NSTextCheckingResult* match in matches) {
        NSString* matchText = [sample_uuid substringWithRange:[match range]];
        NSLog(@"match: %@", matchText);
        NSRange group1 = [match rangeAtIndex:0];
        NSLog(@"group1: %@", [sample_uuid substringWithRange:group1]);
    }
    
    NSLog(@"Our UUID, %@", sample_uuid);
    NSLog(@"Our UUID length, %lu", (unsigned long)[sample_uuid length]);
    
    XCTAssertEqual([matches count], 1, @"UUID generated doesn't match the type 4 UUID RFC");
}

- (void)testCorrectUUIDFormat3
{
    NSString *sample_uuid = [UUIDGenerator uuid4WithCaps:true hypenated:false];
    NSString *pattern = @"[0-9A-F]{12}4[0-9A-F]{3}[89AB][0-9A-F]{15}";
    NSRange searchRange = NSMakeRange(0, [sample_uuid length]);
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *matches = [regex matchesInString:sample_uuid options:0 range:searchRange];
    
    [matches count];
    for (NSTextCheckingResult* match in matches) {
        NSString* matchText = [sample_uuid substringWithRange:[match range]];
        NSLog(@"match: %@", matchText);
        NSRange group1 = [match rangeAtIndex:0];
        NSLog(@"group1: %@", [sample_uuid substringWithRange:group1]);
    }
    
    NSLog(@"Our UUID, %@", sample_uuid);
    NSLog(@"Our UUID length, %lu", (unsigned long)[sample_uuid length]);
    
    XCTAssertEqual([matches count], 1, @"UUID generated doesn't match the type 4 UUID RFC");
}

- (void)testCorrectUUIDFormat4
{
    NSString *sample_uuid = [UUIDGenerator uuid4WithCaps:false hypenated:false];
    NSString *pattern = @"[0-9a-f]{12}4[0-9a-f]{3}[89ab][0-9a-f]{15}";
    NSRange searchRange = NSMakeRange(0, [sample_uuid length]);
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *matches = [regex matchesInString:sample_uuid options:0 range:searchRange];
    
    [matches count];
    for (NSTextCheckingResult* match in matches) {
        NSString* matchText = [sample_uuid substringWithRange:[match range]];
        NSLog(@"match: %@", matchText);
        NSRange group1 = [match rangeAtIndex:0];
        NSLog(@"group1: %@", [sample_uuid substringWithRange:group1]);
    }
    
    NSLog(@"Our UUID, %@", sample_uuid);
    NSLog(@"Our UUID length, %lu", (unsigned long)[sample_uuid length]);
    
    XCTAssertEqual([matches count], 1, @"UUID generated doesn't match the type 4 UUID RFC");
}



@end
