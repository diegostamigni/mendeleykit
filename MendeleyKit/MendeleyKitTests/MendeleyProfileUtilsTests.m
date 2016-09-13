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

#import <XCTest/XCTest.h>
#import "MendeleyProfile.h"
#import "MendeleyProfileUtils.h"

NSString *const kFirstName = @"firstname";
NSString *const kLastName = @"lastname";
NSString *const kEmail = @"firstname.lastname@email.com";
NSString *const kTitle = @"title";
NSString *const kAcademicStatus = @"academic status";
NSString *const kInstitution = @"institution name";
NSString *const kBiography = @"this is my biography";
const NSInteger kMarketing = 1;
NSString *const kDisciplineName = @"discipline";
NSString *const kResearchInterest1 = @"physics";
NSString *const kResearchInterest2 = @"chemistry";
NSString *const kResearchInterest3 = @"biology";

@interface MendeleyProfileUtilsTests : XCTestCase

@end

@implementation MendeleyProfileUtilsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreateAmendmentProfile {
    // Test conversion from MendeleyProfile to MendeleyAmendmentProfile
    
    NSArray *const researchInterests = @[kResearchInterest1, kResearchInterest2, kResearchInterest3];
    
    MendeleyProfile *profile = [MendeleyProfile new];
    profile.first_name = kFirstName;
    profile.last_name = kLastName;
    profile.email = kEmail;
    profile.title = kTitle;
    profile.academic_status = kAcademicStatus;
    profile.institution = kInstitution;
    profile.biography = kBiography;
    profile.marketing = @(kMarketing);
    profile.research_interests_list = researchInterests;
    
    MendeleyDiscipline *discipline = [MendeleyDiscipline new];
    discipline.name = kDisciplineName;
    profile.disciplines = @[discipline];
    
    // Convert to ammendment profile
    MendeleyAmendmentProfile *amendmentProfile = [MendeleyProfileUtils amendmentProfileFromProfile:profile];

    // Test
    XCTAssertEqual(amendmentProfile.first_name, kFirstName, "First names need to match");
    XCTAssertEqual(amendmentProfile.last_name, kLastName, "Last names need to match");
    XCTAssertEqual(amendmentProfile.email, kEmail, "e-mail addresses need to match");
    XCTAssertEqual(amendmentProfile.title, kTitle, "Titles need to match");
    XCTAssertEqual(amendmentProfile.academic_status, kAcademicStatus, "Academic statuses need to match");
    XCTAssertEqual(amendmentProfile.institution, kInstitution, "Institutions need to match");
    XCTAssertEqual(amendmentProfile.biography, kBiography, "Biographies need to match");
    XCTAssertEqual(amendmentProfile.marketing, @(kMarketing), "Marketing IDs need to match");
    XCTAssertEqual(amendmentProfile.research_interests_list, researchInterests, "Research interest lists need to match");
    XCTAssertEqual([amendmentProfile.disciplines count], 1, "Number of disciplines need to match");
    XCTAssertEqual([amendmentProfile.disciplines firstObject].name, kDisciplineName, "s need to match");
    
}

@end
