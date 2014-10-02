/*
 ******************************************************************************
 * Copyright (C) 2014-2017 Elsevier/Mendeley.
 *
 * This file is part of the Mendeley iOS SDK.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *****************************************************************************
 */

#import "MendeleyModels.h"
#import "MendeleyKitTestBaseClass.h"

@interface MendeleyModelTest : MendeleyKitTestBaseClass

@end

@implementation MendeleyModelTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testEncodeAndDecode
{
    MendeleyDocument *document = [[MendeleyDocument alloc] init];

    document.object_ID = @"1234567890";
    document.title = @"some title";
    document.year = [NSNumber numberWithInt:2014];


    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:document];

    MendeleyDocument *unarchivedDocument = [NSKeyedUnarchiver unarchiveObjectWithData:archivedData];

    XCTAssertTrue([document.object_ID isEqualToString:unarchivedDocument.object_ID], @"objectIDs should be equal");
    XCTAssertTrue([document.title isEqualToString:unarchivedDocument.title], @"title should be equal");
    XCTAssertTrue([document.year isEqualToNumber:unarchivedDocument.year], @"year should be equal");

}

@end
