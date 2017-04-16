//
//  MSDataManagerProtocols.h
//  HealthHelper
//
//  Created by Maksym Savisko on 4/7/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#import "MSDataManagerConstants.h"

@class NSManagedObjectContext, FSFilmManagedModel, FSUserManagedModel;

NS_ASSUME_NONNULL_BEGIN

@protocol MSDataManagerProtocol <NSObject>

@property (nonatomic, readonly) NSManagedObjectContext *mainContext;

@end

@protocol MSDataManagerPrivateProtocol <MSDataManagerProtocol>

+ (void)saveWithBlock:(MSDataManagerExecuteOnContextBlock)executionBlock;
+ (void)saveWithBlock:(MSDataManagerExecuteOnContextBlock)executionBlock useSerialQueue:(BOOL)useSerialQueue;
+ (void)saveWithBlock:(MSDataManagerExecuteOnContextBlock)executionBlock completion:(nullable MSDataManagerVoidCompletionBlock)completion;
+ (void)saveWithBlock:(MSDataManagerExecuteOnContextBlock)executionBlock serialQueue:(BOOL)useSerialQueue completion:(nullable MSDataManagerVoidCompletionBlock)completion;

@end

@protocol MSDataManagerUserProtocol <MSDataManagerProtocol>

+ (FSUserManagedModel *)currentUserModelInContext:(nullable NSManagedObjectContext *)context;
+ (FSUserManagedModel *)currentUserModel;

@end

@protocol MSDataManagerSetupProtocol <MSDataManagerProtocol>

+ (void)setupWithCompletion:(nullable MSDataManagerVoidCompletionBlock)completion;
+ (void)setupAtStoreURL:(NSURL *)storeUrl completion:(nullable MSDataManagerVoidCompletionBlock)completion;

@end

@protocol MSDataManagerFilmProtocol <MSDataManagerProtocol>

+ (nullable NSString *)fetchFilmIdByTitle:(NSString *)filmTitle;
+ (nullable NSString *)fetchFilmIdByTitle:(NSString *)filmTitle inContext:(nullable NSManagedObjectContext *)context;

+ (nullable FSFilmManagedModel *)fetchFilmById:(NSString *)filmId inContext:(nullable NSManagedObjectContext *)context;
+ (nullable FSFilmManagedModel *)fetchFilmByImdbId:(NSString *)imdbId inContext:(nullable NSManagedObjectContext *)context;

+ (nullable NSArray<FSFilmManagedModel *> *)fetchFilmsByTitle:(NSString *)filmTitle inContext:(nullable NSManagedObjectContext *)context;
+ (nullable NSArray<NSString *> *)fetchFilmsIdsByTitle:(NSString *)filmTitle inContext:(nullable NSManagedObjectContext *)context;

@end

@protocol MSDataManagerSearchHistoryProtocol <MSDataManagerProtocol>

+ (void)updateSearchHistoryWithChanges:(NSDictionary *)changes completion:(nullable MSDataManagerVoidCompletionBlock)completion;
+ (void)updateSearchHistoryWithChanges:(NSDictionary *)changes inContext:(nullable NSManagedObjectContext *)context completion:(nullable MSDataManagerVoidCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
