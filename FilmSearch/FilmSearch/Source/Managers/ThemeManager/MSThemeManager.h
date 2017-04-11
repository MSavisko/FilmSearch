//
//  MSThemeManager.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSThemeManager : NSObject

// clue for improper use (produces compile time error)
+ (instancetype)alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
- (instancetype)init __attribute__((unavailable("init not available, call sharedInstance instead")));
- (instancetype)copy __attribute__((unavailable("copy not available, call sharedInstance instead")));
+ (instancetype)new __attribute__((unavailable("new not available, call sharedInstance instead")));

/**
 *  Creates and returns singleton instance
 *
 *  @return Singleton Instance of this class.
 */
+ (instancetype)sharedInstance;

- (void)applyAppearance;

- (void)customizeTabBar:(__kindof UITabBar *)tabBar;
- (void)customizeNavigationBar:(__kindof UINavigationBar *)navigationBar;
- (void)customizeButton:(__kindof UIButton *)button;
- (void)customizeTextView:(__kindof UITextField *)textField;

@end
