//
//  UIFont+MSTheme.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (MSTheme)

+ (UIFont *)ms_fontWithSize:(CGFloat)pointSize weight:(CGFloat)weight;
+ (UIFont *)ms_regularFontWithWeight:(CGFloat)weight;

+ (UIFont *)ms_tabBarFontWithWeight:(CGFloat)weight;
+ (UIFont *)ms_navigationBartTitleFontWithWeight:(CGFloat)weight;

@end
