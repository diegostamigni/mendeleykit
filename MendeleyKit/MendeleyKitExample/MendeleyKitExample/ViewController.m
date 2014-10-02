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

#import "ViewController.h"
#import "MendeleyKitConfiguration.h"
#import "MendeleyKit.h"
#import "MendeleyLoginController.h"
#import "DocumentListTableViewController.h"
#import "FilesWithDocumentTableViewController.h"
#import "MendeleyDefaultOAuthProvider.h"
#import "GroupListTableViewController.h"

static NSDictionary * clientOAuthConfig()
{
    return @{ kMendeleyOAuth2ClientIDKey: kMyClientID,
              kMendeleyOAuth2ClientSecretKey : kMyClientSecret,
              kMendeleyOAuth2RedirectURLKey : kMyClientRedirectURI };
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[MendeleyKitConfiguration sharedInstance] configureOAuthWithParameters:clientOAuthConfig()];

    if ([[MendeleyKit sharedInstance] isAuthenticated])
    {
        self.navigationItem.rightBarButtonItem.title = @"Logout";
    }
    else
    {
        self.navigationItem.rightBarButtonItem.title = @"Login";
    }
}

- (IBAction)loginOrOut:(id)sender
{

    if ([[MendeleyKit sharedInstance] isAuthenticated])
    {
        [[MendeleyKit sharedInstance] clearAuthentication];
        self.navigationItem.rightBarButtonItem.title = @"Login";
    }
    else
    {
        MendeleyCompletionBlock loginCompletion = ^void (BOOL success, NSError *loginError){
            if (success)
            {
                self.navigationItem.rightBarButtonItem.title = @"Logout";
                UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Hurrah" message:@"We successfully logged in" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [successAlert show];
            }
            else
            {
                UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Oh dear" message:@"We couldn't log in" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [errorAlert show];
            }
            [self.navigationController popViewControllerAnimated:YES];
        };

        MendeleyLoginController *loginController = [[MendeleyLoginController alloc]
                                                    initWithClientKey:kMyClientID
                                                         clientSecret:kMyClientSecret
                                                          redirectURI:kMyClientRedirectURI
                                                      completionBlock:loginCompletion];
        [self.navigationController pushViewController:loginController animated:YES];
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ControllerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"Get Documents (no files)";
            break;
        case 1:
            cell.textLabel.text = @"Get Documents (check for files)";
            break;
        case 2:
            cell.textLabel.text = @"Get Groups";
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            DocumentListTableViewController *controller = [[DocumentListTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:controller animated:YES];
        }
        break;
        case 1:
        {
            FilesWithDocumentTableViewController *controller = [[FilesWithDocumentTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:controller animated:YES];
        }
        break;
        case 2:
        {
            GroupListTableViewController *controller = [[GroupListTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:controller animated:YES];

        }
        break;
        default:
            break;
    }
}


@end
