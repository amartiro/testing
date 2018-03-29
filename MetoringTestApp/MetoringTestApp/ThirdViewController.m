//
//  ThirdViewController.m
//  MetoringTestApp
//
//  Created by Artak on 3/14/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(notificationAction:) name:@"Samo" object:nil];
//    
//}
//
//-(void) notificationAction:(NSNotification *) notification{
//    NSLog(@"ThirdViewController %@", notification.name);
//    
//}
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
