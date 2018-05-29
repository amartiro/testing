//
//  Helper.m
//  CountryApp
//
//  Created by Artak Martirosyan on 5/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "Helper.h"
#import "Account.h"

@implementation Helper


+(BOOL) isValidUsername:(NSString *) name{
    return name.length > 3;
}

+(BOOL) isValidFirstname:(NSString *) name{
    return true;
}

+(BOOL) isValidLastname:(NSString *) name{
    return true;
}

+(BOOL) isValidPassword:(NSString *) pass{
    return pass.length > 3;
}

+(BOOL) isValidCountry:(NSString *) country{
    return true;
}

+(BOOL) isValidCapital:(NSString *) capital{
    return true;
}

+(BOOL) isValidLanguage:(NSString *) language{
    return true;
}

+(NSError *) getError:(NSString *) desc {
    
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey:desc,
                               NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Field validation.", nil),
                               NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Missing something? ", nil)
                               };
    NSError *error = [NSError errorWithDomain:@"Field"
                                         code:100
                                     userInfo:userInfo];
    
    return error;
    
}

+(NSError *) validateAccount:(Account *) account{

    if (![Helper isValidFirstname:account.firstName]) {
        return [Helper getError:@"Please enter valid firstname."];
    }
    
    if (![Helper isValidLastname:account.lastName]) {
        return [Helper getError:@"Please enter valid lastname."];
    }
    
    if (![Helper isValidUsername:account.userName]) {
        return [Helper getError:@"Please enter valid username."];
    }
    
    if (![Helper isValidPassword:account.password]) {
       return [Helper getError:@"Please enter valid password."];
    }
    
    if (![Helper isValidCountry:account.country]) {
        return [Helper getError:@"Please enter valid country."];
    }
    
    if (![Helper isValidCapital:account.capital]) {
        return [Helper getError:@"Please enter valid capital."];
    }
    
    if (![Helper isValidLanguage:account.language]) {
        return [Helper getError:@"Please enter valid language."];
    }
    
    return nil;
}

+(NSError *) validateUsername:(NSString *) username andPassword:(NSString *) pass{
    if (![Helper isValidUsername:username]) {
        return [Helper getError:@"Please enter valid username."];
    }
    
    if (![Helper isValidPassword:pass]) {
        return [Helper getError:@"Please enter valid password."];
    }

    return nil;
}


@end
