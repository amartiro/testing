//
//  Account.m
//  CountryApp
//
//  Created by Artak Martirosyan on 5/22/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "Account.h"

@implementation Account


+(Account *) parseAccount:(NSDictionary *) dict{
    Account * account = [[Account alloc] init];
    account.firstName = [dict objectForKey:@"firstName"];
    account.lastName = [dict objectForKey:@"lastName"];
    account.userName = [dict objectForKey:@"userName"];
    account.password = [dict objectForKey:@"password"];
    account.country = [dict objectForKey:@"country"];
    account.capital = [dict objectForKey:@"capital"];
    account.language = [dict objectForKey:@"language"];
    
    return account;
}

+(NSDictionary *) getDictionaryofAccount:(Account *) account{
    NSDictionary * accountDetailsDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                         account.firstName, @"firstName",
                                         account.lastName, @"lastName",
                                         account.userName, @"userName",
                                         account.password, @"password",
                                         account.country, @"country",
                                         account.capital, @"capital",
                                         account.language, @"language",
                                         nil];
    
    
    return accountDetailsDict;
}

@end
