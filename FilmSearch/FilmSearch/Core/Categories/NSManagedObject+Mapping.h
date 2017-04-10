//
//  NSManagedObject+Mapping.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <CoreData/CoreData.h>

#import <EasyMapping/EasyMapping.h>

@interface NSManagedObject (Mapping) <EKManagedMappingProtocol>

+ (NSString *)entityName;



@end
