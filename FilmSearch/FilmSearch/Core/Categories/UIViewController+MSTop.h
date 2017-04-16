//
//  UIViewController+MSTop.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/11/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MSTop)

- (UIViewController *)ms_visibleViewController;
- (UIViewController *)ms_topViewController;
- (UIViewController *)ms_topPresentedViewController;

@end

NS_ASSUME_NONNULL_END
