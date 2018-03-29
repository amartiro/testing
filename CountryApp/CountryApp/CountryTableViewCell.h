//
//  CountryTableViewCell.h
//  CountryApp
//
//  Created by Artak on 3/21/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface CountryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
