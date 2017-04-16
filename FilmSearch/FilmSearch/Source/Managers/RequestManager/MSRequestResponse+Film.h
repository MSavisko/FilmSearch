//
//  MSRequestResponse+Film.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/13/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSRequestResponse.h"

@interface MSRequestResponse (Film)

+ (BOOL)isFilmExistInInfo:(NSDictionary *)info;
+ (NSString *)filmIdFromInfo:(NSDictionary *)info;
+ (NSString *)errorTextFromInfo:(NSDictionary *)info;

@end
