//
//  Helper.h
//  CountryApp
//
//  Created by Artak Martirosyan on 5/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Account;

@interface Helper : NSObject
+(BOOL) isValidUsername:(NSString *) name;
+(BOOL) isValidFirstname:(NSString *) name;
+(BOOL) isValidLastname:(NSString *) name;
+(BOOL) isValidPassword:(NSString *) pass;
+(BOOL) isValidCountry:(NSString *) country;
+(BOOL) isValidCapital:(NSString *) capital;
+(BOOL) isValidLanguage:(NSString *) language;

+(NSError *) validateAccount:(Account *) account;



@end
