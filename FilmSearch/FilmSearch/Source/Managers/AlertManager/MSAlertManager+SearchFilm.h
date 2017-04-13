//
//  MSAlertManager+SearchFilm.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSAlertManager.h"

@class MSRequestResponse;

@interface MSAlertManager (SearchFilm)

+ (void) showAlertForFilmSearchResponse:(MSRequestResponse *) response;

@end
