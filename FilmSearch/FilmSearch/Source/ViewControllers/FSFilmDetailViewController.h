//
//  FSFilmDetailViewController.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/12/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "FSBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const FSBaseViewControllerIdentifier;

@interface FSFilmDetailViewController : FSBaseViewController

@property (nullable, nonatomic, strong) NSString *filmId;

@end

NS_ASSUME_NONNULL_END
