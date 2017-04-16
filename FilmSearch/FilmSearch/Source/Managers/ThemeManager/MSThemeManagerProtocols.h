//
//  MSThemeManagerProtocols.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/16/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

@protocol MSThemeManagerProtocol <NSObject>

@end

@protocol MSThemeNavigationProtocol <MSThemeManagerProtocol>

- (void)customizeTabBar:(__kindof UITabBar *)tabBar;
- (void)customizeNavigationBar:(__kindof UINavigationBar *)navigationBar;

@end

@protocol MSThemeControlsProtocol <MSThemeManagerProtocol>

- (void)customizeButton:(__kindof UIButton *)button;

@end
