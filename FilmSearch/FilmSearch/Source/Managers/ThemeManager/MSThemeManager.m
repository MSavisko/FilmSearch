//
//  MSThemeManager.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSThemeManager.h"

#import "UIColor+MSTheme.h"
#import "UIFont+MSTheme.h"
#import "UIImage+MSTheme.h"

#import "FSTabBarController.h"

@implementation MSThemeManager

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

- (instancetype)copy
{
    return self;
}

@end
