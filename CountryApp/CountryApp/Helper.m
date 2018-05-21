//
//  Helper.m
//  CountryApp
//
//  Created by Artak Martirosyan on 5/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "Helper.h"

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

+(BOOL) isValidLanguage:(NSString *) language{
    return true;
}

@end
