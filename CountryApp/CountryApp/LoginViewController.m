//
//  LoginViewController.m
//  CountryApp
//
//  Created by Artak on 3/20/18.
//  Copyright © 2018 Artak. All rights reserved.
//

#import "LoginViewController.h"
#import "UIViewController+ErrorHandler.h"
#import "Helper.h"
#import "AccountManager.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


@property (weak, nonatomic) UITextField *activeTextField;

@end



@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true];
    [self registerForKeyboardNotifications]; 
}

-(void) textFieldDidBeginEditing:(UITextField *)textField{
    self.activeTextField = textField;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
    
}
// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (IBAction)loginAction:(id)sender {
    NSString * username = self.userNameTextField.text;
    if (![Helper isValidUsername:username]) {
        [self showAlertWithTitle:@"Information" andDesctiption:@"Please enter valid username." andComplition:nil];
        return;
    }
    
    NSString * pass = self.passwordTextField.text;
    if (![Helper isValidPassword:pass]) {
        [self showAlertWithTitle:@"Information" andDesctiption:@"Please enter valid password." andComplition:nil];
        return;
    }
    
    if (![[AccountManager sharedManager] accountExistWithUsername:username andPassword:pass]) {
        [self showAlertWithTitle:@"Information" andDesctiption:@"Account doesn't exist" andComplition:nil];
        return;
    }
    
     
   [self performSegueWithIdentifier:@"registrationToMenu" sender:nil];
}


// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height + 50, 0.0);
    _contentScrollView.contentInset = contentInsets;
    _contentScrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect visibleRect = CGRectMake(_activeTextField.frame.origin.x, _activeTextField.frame.origin.y - 1.1 * _activeTextField.frame.size.height, _activeTextField.frame.size.width, 2.1 * _activeTextField.frame.size.height);
   
    [_contentScrollView scrollRectToVisible:visibleRect animated:true];
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _contentScrollView.contentInset = contentInsets;
    _contentScrollView.scrollIndicatorInsets = contentInsets;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
