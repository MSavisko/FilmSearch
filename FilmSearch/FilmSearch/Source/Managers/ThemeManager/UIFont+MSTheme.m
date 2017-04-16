//
//  UIFont+MSTheme.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "UIFont+MSTheme.h"

@implementation UIFont (MSTheme)

+ (UIFont *)ms_fontWithSize:(CGFloat)pointSize weight:(CGFloat)weight
{
    return [UIFont systemFontOfSize:pointSize weight:weight];
}

+ (UIFont *)ms_regularFontWithWeight:(CGFloat)weight
{
    return [self ms_fontWithSize:14 weight:weight];
}


+ (UIFont *)ms_tabBarFontWithWeight:(CGFloat)weight
{
    return [self ms_fontWithSize:10 weight:weight];
}

+ (UIFont *)ms_navigationBartTitleFontWithWeight:(CGFloat)weight
{
    return [self ms_fontWithSize:17 weight:weight];
}


@end
