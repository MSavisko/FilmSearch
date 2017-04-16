//
//  UIImage+MSTheme.m
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "UIImage+MSTheme.h"

@implementation UIImage (MSTheme)

+ (UIImage *)ms_buttonOutlinedImage
{
    return [[UIImage imageNamed:@"btn_outline"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

+ (UIImage *)ms_buttonFilledImage
{
    return [[UIImage imageNamed:@"btn_outline_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}


@end
