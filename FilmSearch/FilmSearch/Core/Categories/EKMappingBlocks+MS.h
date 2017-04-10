//
//  EKMappingBlocks+MS.h
//  FilmSearch
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import <EasyMapping/EasyMapping.h>

@interface EKMappingBlocks (MS)

+ (nonnull EKManagedMappingReverseValueBlock)secondsToStringManagedMappingBlock;

+ (nonnull EKMappingValueBlock)secondsFromStringMappingBlock;
+ (nonnull EKMappingReverseBlock)secondsToStringMappingBlock;

+ (nonnull EKManagedMappingValueBlock)nullManagedMappingBlock;
+ (nonnull EKManagedMappingReverseValueBlock)toNullManagedMappingBlock;

+ (nonnull EKMappingValueBlock)nullMappingBlock;
+ (nonnull EKMappingReverseBlock)toNullMappingBlock;

+ (nonnull EKManagedMappingValueBlock)stringManagedMappingBlock;
+ (nonnull EKManagedMappingReverseValueBlock)toStringManagedMappingBlock;

+ (nonnull EKMappingValueBlock)stringMappingBlock;
+ (nonnull EKMappingReverseBlock)toStringMappingBlock;

+ (nonnull EKManagedMappingValueBlock)stringToDateManagedMappingBlockUsingFormatter:(nonnull NSDateFormatter *)formatter;
+ (nonnull EKManagedMappingReverseValueBlock)dateToStringManagedMappingBlockUsingFormatter:(nonnull NSDateFormatter *)formatter;

+ (nonnull EKMappingValueBlock)stringToDateMappingBlockUsingFormatter:(nonnull NSDateFormatter *)formatter;
+ (nonnull EKMappingReverseBlock)dateToStringMappingBlockUsingFormatter:(nonnull NSDateFormatter *)formatter;

@end
