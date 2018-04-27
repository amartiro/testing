//
//  CountriesModel.m
//  CountryApp
//
//  Created by Artak Martirosyan on 4/27/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "CountriesModel.h"
#import "NetworkManager.h"

@implementation CountriesModel



//{
//    
//    [[NetworkManager sharedManager] getCountriesForRegion:self.region success:^(id responseObject) {
//        [self.countries removeAllObjects];
//        NSArray * countriesArray = [NSArray arrayWithArray:responseObject];
//        for (int i =0; i < countriesArray.count; ++i){
//            NSDictionary * countryDict = countriesArray[i];
//            Country * country = [[Country alloc] intitWithDict:countryDict];
//            [self.countries addObject:country];
//        }
//        [self.countriesTableView reloadData];
//        // Allow User Access and load content
//        //[self loadContent];
//    } failure:^(NSString *failureReason, NSInteger statusCode) {
//        // Logout user if logged in and deny access and show login view
//        //[self showLoginView];
//    }];
//    
//}
@end
