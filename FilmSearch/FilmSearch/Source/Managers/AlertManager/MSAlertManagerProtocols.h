//
//  MSAlertManagerProtocols.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/16/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

@class MSRequestResponse;

NS_ASSUME_NONNULL_BEGIN

@protocol MSAlertManagerProtocol <NSObject>

- (void)showAlertWithText:(nullable NSString *)text andTitle:(nullable NSString *)title;

@end

@protocol MSAlertSearchFilmProtocol <MSAlertManagerProtocol>

+ (void)showAlertForFilmSearchResponse:(MSRequestResponse *)response;
+ (void)showAlertForEmptyFilmSearch;

@end

NS_ASSUME_NONNULL_END
