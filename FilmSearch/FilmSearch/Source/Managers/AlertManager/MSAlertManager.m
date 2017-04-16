//
//  MSAlertManager.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSAlertManager.h"

#import "UIColor+MSTheme.h"

@interface MSAlertManager ()

@end

@implementation MSAlertManager

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static dispatch_once_t pred;
    static id sharedInstance = nil;
    dispatch_once(&pred, ^{

        sharedInstance = [[super alloc] initUniqueInstance];
    });

    return sharedInstance;
}

- (instancetype)initUniqueInstance
{
    self = [super init];

    if (self) {
    }

    return self;
}

- (id)copy
{
    return self;
}

#pragma mark - Public

- (void)showAlertWithText:(nullable NSString *)text andTitle:(nullable NSString *)title
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:text preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", @"v1.0") style:UIAlertActionStyleCancel handler:nil];

    [alert addAction:okAction];

    alert.view.tintColor = [UIColor ms_primaryRedColor];

    [[self.class presentingViewController] presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Private

+ (UIViewController *)presentingViewController
{
    return [[[[UIApplication sharedApplication] delegate] window].rootViewController ms_topPresentedViewController];
}

@end
