//
//  CountriesModel.m
//  CountryApp
//
//  Created by Artak Martirosyan on 4/27/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "CountriesModel.h"
#import "NetworkManager.h"
#import "Country.h"

@implementation CountriesModel


static CountriesModel *sharedModel = nil;

+ (CountriesModel*)sharedManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedModel = [[CountriesModel alloc] init];
    });
    return sharedModel;
}

- (void)getCountriesForRegion:(NSString *) region success:(CountryManagerSuccess)success failure:(CountryManagerFailure)failure{
    NSMutableArray * countries = [NSMutableArray array];
    
    [[NetworkManager sharedManager] getCountriesForRegion:region success:^(id responseObject) {
        NSDictionary * responseDict = responseObject;
        
        NSArray * countriesArray = [responseDict objectForKey:@"Response"];
        for (int i =0; i < countriesArray.count; ++i){
            NSDictionary * countryDict = countriesArray[i];
            Country * country = [[Country alloc] intitWithDict:countryDict];
            [countries addObject:country];
        }
        
        if (success != nil) {
            success(countries);
        }
    } failure:^(NSString *failureReason, NSInteger statusCode) {
        if (failure != nil) {
            failure(failureReason, statusCode);
        }
    }];
    
}

@end
