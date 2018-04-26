//
//  NetworkManager.m
//  CountryApp
//
//  Created by Artak on 3/23/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "NetworkManager.h"

#define ENABLE_SSL 1
#define HOST @"restcountries.eu/rest/v2/"
#define PROTOCOL (ENABLE_SSL ? @"https://" : @"http://")
#define BASE_URL [NSString stringWithFormat:@"%@%@", PROTOCOL, HOST]


@implementation NetworkManager

#pragma mark -
#pragma mark Constructors

static NetworkManager *sharedManager = nil;

+ (NetworkManager*)sharedManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^
                  {
                      sharedManager = [[NetworkManager alloc] init];
                  });
    return sharedManager;
}

- (id)init {
    if ((self = [super init])) {
        self.appID = @"1";
    }
    return self;
}

- (void)test {
    NSLog(@"Testing out the networking singleton for appID");
 //   NSLog(@"Testing out the networking singleton for ”);
}

- (AFHTTPSessionManager*)getNetworkingManager {
    if (self.networkingManager == nil) {
        self.networkingManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
       
//        self.networkingManager.requestSerializer = [AFJSONRequestSerializer serializer];
//        self.networkingManager.responseSerializer.acceptableContentTypes = [self.networkingManager.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/html", @"application/json", @"text/json"]];
        self.networkingManager.securityPolicy = [self getSecurityPolicy];
    }
    return self.networkingManager;
}

- (id)getSecurityPolicy {
    return [AFSecurityPolicy defaultPolicy];
}

- (NSString*)getError:(NSError*)error {
    if (error != nil) {
        NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];
        if (responseObject != nil && [responseObject isKindOfClass:[NSDictionary class]] && [responseObject objectForKey:@"message"] != nil && [[responseObject objectForKey:@"message"] length] > 0) {
            return [responseObject objectForKey:@"message"];
        }
    }
    return @"Server Error. Please try again later";
}

- (void)getCountriesForRegion:(NSString *) region success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure {
 //   [self showProgressHUD];
    ///region/europe?fields=name;capital;callingCodes;subregion;latlng;population;flag
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@"name;capital;callingCodes;subregion;latlng;population;flag" forKey:@"fields"];
    [[self getNetworkingManager] GET:[NSString stringWithFormat:@"region/%@", region] parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
 //       [self hideProgressHUD];
        if (success != nil) {
            success(responseObject);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        [self hideProgressHUD];
        NSString *errorMessage = [self getError:error];
        if (failure != nil) {
            failure(errorMessage, ((NSHTTPURLResponse*)operation.response).statusCode);
        }
    }];
}

@end
