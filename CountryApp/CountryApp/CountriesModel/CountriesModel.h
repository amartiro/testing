//
//  CountriesModel.h
//  CountryApp
//
//  Created by Artak Martirosyan on 4/27/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Country;

typedef void (^CountryManagerSuccess)(NSArray<Country*>* countries);
typedef void (^CountryManagerFailure)(NSString *failureReason, NSInteger statusCode);


@interface CountriesModel : NSObject

- (void)getCountriesForRegion:(NSString *) region success:(CountryManagerSuccess)success failure:(CountryManagerFailure)failure;

+ (id)sharedManager;

@end
