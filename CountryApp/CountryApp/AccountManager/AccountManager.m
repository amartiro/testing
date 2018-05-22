//
//  AccountManager.m
//  CountryApp
//
//  Created by Artak Martirosyan on 5/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "AccountManager.h"

@implementation AccountManager

static AccountManager *sharedModel = nil;

+ (AccountManager*)sharedManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedModel = [[AccountManager alloc] init];
    });
    return sharedModel;
}

- (BOOL) doesAccountExistWithUsername:(NSString *) userName andPassword:(NSString *) pass{
    return true;
}

- (void) registerAccount:(Account *) account success:(void(^)(void))success failure:(void(^)(NSError *))failure{
    success();
}


@end
