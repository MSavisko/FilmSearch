//
//  FSFilmManagedModel.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FSHistoryItemManagedModel;

NS_ASSUME_NONNULL_BEGIN

@interface FSFilmManagedModel : NSManagedObject

+ (UIImage *) placeholder;
- (nullable NSString *) stringReleaseDate;

@end

NS_ASSUME_NONNULL_END

#import "FSFilmManagedModel+CoreDataProperties.h"
