//
//  UUIDGenerator.h
//  UUIDGenerator
//
//  Created by Jonathan Almeida on 2014-05-15.
//  Copyright (c) 2014 Jonathan Almeida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>
#import <Security/SecRandom.h>

@interface UUIDGenerator : NSObject
/**
 *  UUID type 4 generator
 *  @param caps UUID string in all caps
 *  @param hypen The UUID string with the 8-4-4-12 format
 *  @return Returns UUID as a string
 */
- (NSString *) uuid4WithCaps:(Boolean)caps hypenated:(Boolean)hypen;

@end
