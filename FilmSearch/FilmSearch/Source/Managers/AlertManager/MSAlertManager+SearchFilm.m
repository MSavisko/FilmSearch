//
//  MSAlertManager+SearchFilm.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSAlertManager+SearchFilm.h"

#import "MSRequestResponse+Film.h"

@implementation MSAlertManager (SearchFilm)

#pragma mark - Public

+ (void)showAlertForFilmSearchResponse:(MSRequestResponse *)response
{
    [[self sharedInstance] showAlertForFilmSearchResponse:response];
}

+ (void)showAlertForEmptyFilmSearch
{
    [[self sharedInstance] showAlertForEmptyFilmSearch];
}

#pragma mark - Private

- (void)showAlertForFilmSearchResponse:(MSRequestResponse *)response
{
    if (response.isSuccess) {
        [self showAlertWithText:[MSRequestResponse errorTextFromInfo:response.object] andTitle:NSLocalizedString(@"Film Search", @"v1.0")];
    } else {
        NSString *alertText = [MSRequestResponse errorTextFromResponse:response.error];
        if (alertText.length == 0) {
            return;
        }
        [self showAlertWithText:alertText andTitle:NSLocalizedString(@"Error", @"v1.0")];
    }
}

- (void)showAlertForEmptyFilmSearch
{
    [self showAlertWithText:NSLocalizedString(@"Film title could not be empty", @"v1.0") andTitle:NSLocalizedString(@"Film Search", @"v1.0")];
}

@end
