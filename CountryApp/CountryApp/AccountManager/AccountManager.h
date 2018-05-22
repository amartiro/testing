//
//  AccountManager.h
//  CountryApp
//
//  Created by Artak Martirosyan on 5/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "Account.h"

@interface AccountManager : NSObject

+ (id)sharedManager;

- (BOOL) doesAccountExistWithUsername:(NSString *) userName andPassword:(NSString *) pass;
- (void) registerAccount:(Account *) account success:(void(^)(void))success failure:(void(^)(NSError *))failure;

@end
