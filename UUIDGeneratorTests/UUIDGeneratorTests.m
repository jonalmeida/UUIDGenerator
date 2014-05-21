//
//  UUIDGeneratorTests.m
//  UUIDGeneratorTests
//
//  Created by Jonathan Almeida on 2014-05-15.
//  Copyright (c) 2014 Jonathan Almeida. All rights reserved.
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
    NSString *pattern = @"[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-4[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}";
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
    NSString *pattern = @"[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-4[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}";
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
    NSString *pattern = @"[0-9a-fA-F]{8}-?[0-9a-fA-F]{4}-?4[0-9a-fA-F]{3}-?[89abAB][0-9a-fA-F]{3}-?[0-9a-fA-F]{12}";
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
    NSString *pattern = @"[0-9a-fA-F]{8}-?[0-9a-fA-F]{4}-?4[0-9a-fA-F]{3}-?[89abAB][0-9a-fA-F]{3}-?[0-9a-fA-F]{12}";
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
