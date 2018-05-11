//
//  NetworkManager.m
//  CountryApp
//
//  Created by Artak on 3/23/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "NetworkManager.h"
#import "SVProgressHUD.h"

#define ENABLE_SSL 1

//http://countryapi.gear.host/v1/Country/getCountries?pRegion=Americas&pSubRegion=Central%20America
#define HOST @"countryapi.gear.host/v1/"

#define PROTOCOL (ENABLE_SSL ? @"https://" : @"http://")
#define BASE_URL [NSString stringWithFormat:@"%@%@", PROTOCOL, HOST]

@interface NetworkManager()
@property NSString *appID;
@property (nonatomic, strong) AFHTTPSessionManager *networkingManager;
@end

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

- (AFHTTPSessionManager*)getNetworkingManager {
    if (self.networkingManager == nil) {
        self.networkingManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
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

- (void)getCountriesForRegion:(NSString *) region andSubRegion:(NSString *) subregion success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure{
    [self showProgressHUD];
    
    NSString *urlString = [NSString stringWithFormat:@"Country/getCountries?pRegion=%@&pSubRegion=%@", region, subregion];
    
  //   urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet whitespaceCharacterSet]];
    
//    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    [[self getNetworkingManager] GET:urlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
               [self hideProgressHUD];
        if (success != nil) {
            success(responseObject);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
                [self hideProgressHUD];
        NSString *errorMessage = [self getError:error];
        if (failure != nil) {
            failure(errorMessage, ((NSHTTPURLResponse*)operation.response).statusCode);
        }
    }];
}


- (void)showProgressHUD {
    [self hideProgressHUD];
    [SVProgressHUD show];
}

- (void)hideProgressHUD {
    [SVProgressHUD dismiss];
}


@end
