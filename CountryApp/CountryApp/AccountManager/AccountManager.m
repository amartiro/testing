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

- (BOOL) accountExistWithUsername:(NSString *) userName andPassword:(NSString *) pass{
    return true;
}

- (BOOL) registerAccount:(Account *) account{
    return true;
    
}


@end
