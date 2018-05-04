//
//  NetworkManager.h
//  CountryApp
//
//  Created by Artak on 3/23/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


typedef void (^NetworkManagerSuccess)(id responseObject);
typedef void (^NetworkManagerFailure)(NSString *failureReason, NSInteger statusCode);


@interface NetworkManager : NSObject

@property NSString *appID;
@property (nonatomic, strong) AFHTTPSessionManager *networkingManager;

- (void)getCountriesForRegion:(NSString *) region success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure;

- (void)getCountriesForNewRegion:(NSString *) region success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure;

- (void)test;

+ (id)sharedManager;

@end

