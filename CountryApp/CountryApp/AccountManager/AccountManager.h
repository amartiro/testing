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

- (BOOL) accountExistWithUsername:(NSString *) userName andPassword:(NSString *) pass;
- (BOOL) registerAccount:(Account *) account;

@end
