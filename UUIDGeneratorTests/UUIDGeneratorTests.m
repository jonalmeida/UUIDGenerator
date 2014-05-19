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
    UUIDGenerator *u_generator = [[UUIDGenerator alloc] init];
    NSLog(@"UUID4: %@", [u_generator uuid4WithCaps:false hypenated:false]);
    NSLog(@"UUID4: %@", [u_generator uuid4WithCaps:true hypenated:false]);
    NSLog(@"UUID4: %@", [u_generator uuid4WithCaps:false hypenated:true]);
    NSLog(@"UUID4: %@", [u_generator uuid4WithCaps:true hypenated:true]);
}

@end
