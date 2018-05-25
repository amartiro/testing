//
//  AccountManager.m
//  CountryApp
//
//  Created by Artak Martirosyan on 5/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "AccountManager.h"
#import "SAMKeychain.h"
#import "SAMKeychainQuery.h"

@implementation AccountManager

static AccountManager *sharedModel = nil;

static NSString *serviceName = @"Account";
static NSString *detailsServiceName = @"AccountDetails";

static NSString *accountKey = @"AccountKey";




+ (AccountManager*)sharedManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedModel = [[AccountManager alloc] init];
    });
    return sharedModel;
}

-(NSString *) getAccountName{
    
    return [[NSUserDefaults standardUserDefaults] valueForKey:accountKey];
}

-(void) setAccountName:(NSString *) name{
    [[NSUserDefaults standardUserDefaults] setObject:name forKey:accountKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void) removeAccountName{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:accountKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


- (BOOL) doesAccountExistWithUsername:(NSString *) userName andPassword:(NSString *) pass{
    
    NSError *error = nil;
    SAMKeychainQuery *query = [[SAMKeychainQuery alloc] init];
    query.service = serviceName;
    query.account = userName;
    query.password = pass;
    [query fetch:&error];
    
     if (error != nil) {
         if ([error code] == errSecItemNotFound) {
             NSLog(@"Password not found");
         } else {
             NSLog(@"Some other error occurred: %@", [error localizedDescription]);
         }
        return false;
    }
    
    return true;
}

- (void) registerAccount:(Account *) account success:(void(^)(void))success failure:(void(^)(NSError *))failure{
    NSError * error = nil;
    
    if ([SAMKeychain setPassword:account.password forService:serviceName account:account.userName error:&error]) {
        NSDictionary * accountDetailsDict = [Account getDictionaryofAccount:account];
        
        NSData *accountDetailsData = [NSKeyedArchiver archivedDataWithRootObject:accountDetailsDict];
        
        if ([SAMKeychain setPasswordData:accountDetailsData forService:detailsServiceName account:account.userName error:&error]) {
            success();
        } else {
            failure(error);
        }
    } else {

        failure(error);
    }
}

- (void) getAccountWithUsername:(NSString *) userName  success:(void(^)(Account *))success failure:(void(^)(NSError *))failure{
    NSError *error = nil;
    SAMKeychainQuery *query = [[SAMKeychainQuery alloc] init];
    query.service = detailsServiceName;
    query.account = userName;
    [query fetch:&error];
    
    if (error != nil) {
        if ([error code] == errSecItemNotFound) {
            NSLog(@"Password not found");
        } else {
            NSLog(@"Some other error occurred: %@", [error localizedDescription]);
        }
        failure(error);
    } else {
        
        NSDictionary *myDictionary = (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:query.passwordData];

        Account * account = [Account parseAccount:myDictionary];
        success(account);
    }
}

- (void) deleteAccountWithUsername:(NSString *) username success:(void(^)(void))success failure:(void(^)(NSError *))failure{
    NSError *error = nil;

    if ([SAMKeychain deletePasswordForService:serviceName account:username error:&error]) {

        if ([SAMKeychain deletePasswordForService:detailsServiceName account:username error:&error]) {
            success();
        } else {
            failure(error);
        }
    } else {
        
        failure(error);
    }
    
}


@end
