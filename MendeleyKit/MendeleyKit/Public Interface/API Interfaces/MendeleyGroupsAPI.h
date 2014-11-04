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

#import "MendeleyObjectAPI.h"
#import "MendeleyGroup.h"

@interface MendeleyGroupsAPI : MendeleyObjectAPI
/**
   @name MendeleyGroupsAPI
   This class provides access methods to the REST groups API
   All of the methods are accessed via MendeleyKit.
   Developers should use the methods provided in MendeleyKit rather
   than the methods listed here.
 */

/**
   @param queryParameters
   @param iconType
   @param completionBlock
 */
- (void)groupListWithQueryParameters:(MendeleyGroupParameters *)queryParameters
                            iconType:(MendeleyGroupIconType)iconType
                     completionBlock:(MendeleyArrayCompletionBlock)completionBlock;

/**
   This method is only used when paging through a list of groups on the server.
   All required parameters are provided in the linkURL, which should not be modified

   @param linkURL the full HTTP link to the document listings page
   @param iconType
   @param completionBlock
 */
- (void)groupListWithLinkedURL:(NSURL *)linkURL
                      iconType:(MendeleyGroupIconType)iconType
               completionBlock:(MendeleyArrayCompletionBlock)completionBlock;

/**
   @param groupID
   @param iconType
   @param completionBlock
 */
- (void)groupWithGroupID:(NSString *)groupID
                iconType:(MendeleyGroupIconType)iconType
         completionBlock:(MendeleyObjectCompletionBlock)completionBlock;

/**
   @param groupID
   @param queryParameters
   @param completionBlock
 */
- (void)groupMemberListWithGroupID:(NSString *)groupID
                        parameters:(MendeleyGroupParameters *)queryParameters
                   completionBlock:(MendeleyArrayCompletionBlock)completionBlock;



/**
   Obtain a list of groups where the logged in user is a member
   If provided, it will include the square icon for the group
   @param queryParameters the parameters to be used in the API request
   @param completionBlock the list of groups if found
 */
- (void)groupListWithQueryParameters:(MendeleyGroupParameters *)queryParameters
                     completionBlock:(MendeleyArrayCompletionBlock)completionBlock;

/**
   This method is only used when paging through a list of groups on the server.
   All required parameters are provided in the linkURL, which should not be modified

   @param linkURL the full HTTP link to the document listings page
   @param completionBlock the list of groups if found
 */
- (void)groupListWithLinkedURL:(NSURL *)linkURL
               completionBlock:(MendeleyArrayCompletionBlock)completionBlock;

/**
   Obtain details for the group identified by the given groupID
   @param groupID the group UUID
   @param completionBlock the group
 */
- (void)groupWithGroupID:(NSString *)groupID
         completionBlock:(MendeleyObjectCompletionBlock)completionBlock;


/**
   Obtains a group icon for a specified MendeleyGroup and icon type (maybe standard, square, original)
   @param group
   @param iconType
   @param completionBlock returning the image data as NSData
 */
- (MendeleyTask *)groupIconForGroup:(MendeleyGroup *)group
                           iconType:(MendeleyGroupIconType)iconType
                    completionBlock:(MendeleyBinaryDataCompletionBlock)completionBlock;


/**
   Obtains a group icon based on the given link URL string
   @param iconURLString
   @param completionBlock returning the image data as NSData
 */
- (MendeleyTask *)groupIconForIconURLString:(NSString *)iconURLString
                            completionBlock:(MendeleyBinaryDataCompletionBlock)completionBlock;

@end
