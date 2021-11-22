//
//  GoogleDriveAPI.h
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 20/11/21.
//

#import <Foundation/Foundation.h>

// Since the SPM couldn't find and expose the Google Drive modules for importing, I thought of a different route - embedding the framework and then exposing it manually into Swift through a simplified API

NS_ASSUME_NONNULL_BEGIN

@interface GoogleDriveAPI : NSObject

@end

NS_ASSUME_NONNULL_END
