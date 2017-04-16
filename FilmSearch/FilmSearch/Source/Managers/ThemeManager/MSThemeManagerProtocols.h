//
//  MSThemeManagerProtocols.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/16/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@protocol MSThemeManagerProtocol <NSObject>

@end

@protocol MSThemeNavigationProtocol <MSThemeManagerProtocol>

- (void)customizeTabBar:(__kindof UITabBar *)tabBar;
- (void)customizeNavigationBar:(__kindof UINavigationBar *)navigationBar;

@end

@protocol MSThemeControlsProtocol <MSThemeManagerProtocol>

- (void)customizeButton:(__kindof UIButton *)button;

@end

@protocol MSThemeViewsProtocol <MSThemeManagerProtocol>

- (void)customizeTextView:(__kindof UITextField *)textField;
- (void)customizeTextView:(__kindof UITextField *)textField withPlaceholderText:(nullable NSString *)placeholderText;

NS_ASSUME_NONNULL_END

@end
