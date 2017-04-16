//
//  UIColor+MSTheme.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "UIColor+MSTheme.h"

@implementation UIColor (MSTheme)

#pragma mark - Primary colors

+ (UIColor *)ms_primaryRedColor
{
    return [UIColor colorWithRed:198.f / 255.f green:41.f / 255.f blue:45.f / 255.f alpha:1.0];
}

+ (UIColor *)ms_primaryGreyColor
{
    return [UIColor colorWithRed:152.f / 255.f green:149.f / 255.f blue:143.f / 255.f alpha:1.0];
}

+ (UIColor *)ms_primaryWhiteColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)ms_primaryBlackColor
{
    return [UIColor blackColor];
}

#pragma mark - 

+ (UIColor *)ms_tabBarItemColor
{
    return [self ms_primaryGreyColor];
}

+ (UIColor *)ms_tabBarItemColorSelected
{
    return [self ms_primaryRedColor];
}

+ (UIColor *)ms_navigationTitleColor
{
    return [self ms_primaryRedColor];
}

+ (UIColor *)ms_buttonTextColor
{
    return [self ms_primaryRedColor];
}

+ (UIColor *)ms_buttonBackgroundColor
{
    return [self ms_primaryWhiteColor];
}

+ (UIColor *)ms_textFieldBorderColor
{
    return [self ms_primaryGreyColor];
}

+ (UIColor *)ms_historyCellTitleColor
{
    return [self ms_primaryGreyColor];
}

+ (UIColor *)ms_historyCellSearchDateColor
{
    return [self ms_primaryRedColor];
}

@end
