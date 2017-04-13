//
//  MSRequestManagerConstants.h
//  HealthHelper
//
//  Created by Maksym Savisko on 4/7/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#ifndef MSRequestManagerConstants_h
#define MSRequestManagerConstants_h

@class MSRequestResponse;

static NSString *const MSRequestManagerServerAddressStage = @"http://www.omdbapi.com/";
static NSString *const MSRequestManagerServerAddressProduction = @"http://www.omdbapi.com/";

static NSString *const MSRequestManagerAccessTokenField = @"Authorization"; //NOT used
static NSString *const MSRequestManagerContentTypeField = @"Content-Type";
static NSString *const MSRequestManagerContentType = @"application/json";
static NSString *const MSRequestManagerCallPrefix = @"/api/"; //Not used

static NSString *const MSRequestManagerInternetDidBecomeReachableNotification = @"MSRequestManagerInternetDidBecomeReachableNotification";
static NSString *const MSRequestManagerInternetDidBecomeUnreachableNotification = @"MSRequestManagerInternetDidBecomeUnreachableNotification";

typedef void (^MSRequestManagerVoidCompletionBlock)();
typedef void (^MSRequestManagerResponseCompletionBlock)(MSRequestResponse *response);

#endif /* MSRequestManagerConstants_h */
