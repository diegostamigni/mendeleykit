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

#import "MendeleyMetadataAPI.h"

@implementation MendeleyMetadataAPI

#pragma mark Private methods

- (NSDictionary *)defaultServiceRequestHeaders
{
    return @{ kMendeleyRESTRequestAccept: kMendeleyRESTRequestJSONMetadataLookupType };
}

#pragma mark -

- (void)metadataLookupWithQueryParameters:(MendeleyMetadataParameters *)queryParameters
                                     task:(MendeleyTask *)task
                          completionBlock:(MendeleyObjectCompletionBlock)completionBlock
{
    if (nil == queryParameters)
    {
        NSError *error = nil;
        error = [NSError errorWithCode:kMendeleyModelOrPropertyNilErrorCode
                  localizedDescription:@"Metadata API query parameters must not be nil"];

        if (nil != completionBlock)
        {
            completionBlock(nil, nil, error);
        }
        return;
    }
    NSDictionary *query = [queryParameters valueStringDictionaryWithNoLimit];

    [self.helper mendeleyObjectOfType:kMendeleyModelMetadataLookup
                           parameters:query
                                  api:kMendeleyRESTAPIMetadata
                    additionalHeaders:[self defaultServiceRequestHeaders]
                                 task:task
                      completionBlock:completionBlock];
}

@end
