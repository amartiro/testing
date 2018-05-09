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

- (void)getCountriesForRegion:(NSString *) region success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure;

+ (id)sharedManager;

@end

