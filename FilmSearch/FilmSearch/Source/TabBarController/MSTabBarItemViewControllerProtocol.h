//
//  MSTabBarItemViewControllerProtocol.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MSTabBarItemViewControllerProtocol <NSObject>

@optional
- (BOOL)shouldPopToRootViewControllerAfterTappingOnTabBarItem;

@end
