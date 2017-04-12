//
//  FSHistoryItemManagedModel.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FSFilmManagedModel, FSUserManagedModel;

NS_ASSUME_NONNULL_BEGIN

@interface FSHistoryItemManagedModel : NSManagedObject

+ (NSDictionary *) representationWithSearchTitle:(NSString *) searchTitle andFilmInfo:(NSDictionary *) filmInfo;

@end

NS_ASSUME_NONNULL_END

#import "FSHistoryItemManagedModel+CoreDataProperties.h"
