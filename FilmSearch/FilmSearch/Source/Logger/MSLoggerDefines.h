//
//  MSLoggerDefines.h
//  HealthHelper
//
//  Created by Maksym Savisko on 4/10/17.
//  Copyright © 2017 Maksym Savisko. All rights reserved.
//

#ifndef MSLoggerDefines_h
#define MSLoggerDefines_h

#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelAll;

#ifdef DEBUG

#define MSLogWarning(...)         do { DDLogWarn(__VA_ARGS__);       } while(0)
#define MSLogError(...)           do { DDLogError(__VA_ARGS__);      } while(0)
#define MSLogDebug(...)           do { DDLogDebug(__VA_ARGS__);      } while(0)
#define MSLogVerbose(...)         do { DDLogVerbose(__VA_ARGS__);    } while(0)
#define MSLogInfo(...)            do { DDLogInfo(__VA_ARGS__);       } while(0)

#define MSLogCoreData(...)        do { DDLogVerbose(__VA_ARGS__);    } while(0)
#define MSLogStore(...)           do { DDLogDebug(__VA_ARGS__);      } while(0)
#define MSLogRequest(...)         do { DDLogDebug(__VA_ARGS__);      } while(0)

#else // NOT DEBUG

#define MSLogWarning(...)         do { DDLogVerbose(__VA_ARGS__); } while(0)
#define MSLogError(...)           do { DDLogVerbose(__VA_ARGS__); } while(0)
#define MSLogDebug(...)           do { DDLogVerbose(__VA_ARGS__); } while(0)
#define MSLogVerbose(...)         do { DDLogVerbose(__VA_ARGS__); } while(0)
#define MSLogInfo(...)            do { DDLogVerbose(__VA_ARGS__); } while(0)

#define MSLogCoreData(...)        do { DDLogVerbose(__VA_ARGS__); } while(0)
#define MSLogStore(...)           do { DDLogVerbose(__VA_ARGS__); } while(0)
#define MSLogRequest(...)         do { DDLogVerbose(__VA_ARGS__); } while(0)

#endif


#endif /* MSLoggerDefines_h */
