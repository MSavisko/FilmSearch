//
//  MSRequestManager+Films.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSRequestManager.h"

@interface MSRequestManager (Films)

- (void) findFilmByName:(nonnull NSString *)filmName andCompletion:(nullable MSRequestManagerResponseCompletionBlock)completion;

@end
