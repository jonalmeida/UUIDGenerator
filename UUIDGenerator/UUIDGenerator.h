//
//  UUIDGenerator.h
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
+ (NSString *) uuid4WithCaps:(Boolean)caps hypenated:(Boolean)hypen;

@end
