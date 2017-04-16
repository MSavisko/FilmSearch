//
//  UIColor+MSTheme.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MSTheme)

+ (UIColor *)ms_primaryRedColor;
+ (UIColor *)ms_primaryGreyColor;
+ (UIColor *)ms_primaryWhiteColor;
+ (UIColor *)ms_primaryBlackColor;

+ (UIColor *)ms_tabBarItemColor;
+ (UIColor *)ms_tabBarItemColorSelected;

+ (UIColor *)ms_navigationTitleColor;
+ (UIColor *)ms_buttonTextColor;
+ (UIColor *)ms_buttonBackgroundColor;

+ (UIColor *)ms_textFieldBorderColor;

+ (UIColor *)ms_historyCellTitleColor;
+ (UIColor *)ms_historyCellSearchDateColor;

@end
