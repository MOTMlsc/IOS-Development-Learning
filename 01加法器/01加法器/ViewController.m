//
//  ViewController.m
//  01加法器
//
//  Created by liusicheng on 2021/2/23.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtNum1;
@property (weak, nonatomic) IBOutlet UITextField *txtNum2;

@property (weak, nonatomic) IBOutlet UILabel *lblReult;

- (IBAction)compute;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)compute {
    NSString *num1 = self.txtNum1.text;
    NSString *num2 = self.txtNum2.text;
    int n1 = [num1 intValue];
    int n2 = [num2 intValue];
    int res = n1 + n2;
    self.lblReult.text = [NSString stringWithFormat:@"%d",res];
    
//    键盘回弹
//    [self.txtNum2 resignFirstResponder];
//    [self.txtNum1 resignFirstResponder];
    
    [self.view endEditing:YES];
}


@end
