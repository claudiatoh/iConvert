//
//  SecondViewController.m
//  iConvert
//
//  Created by Claudia Toh Yi An on 12/7/16.
//  Copyright © 2016 Claudia Toh. All rights reserved.
//

#import "SecondViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface SecondViewController ()<CRCurrencyRequestDelegate>
@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    self.convertButton.enabled = NO;
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}
- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled = YES;
    double inputValue = [self.inputField.text floatValue];
    double eur = inputValue * currencies.EUR;
    NSString *eurValue = [NSString stringWithFormat:@"%.2f", eur];
    double jpy = inputValue * currencies.JPY;
    NSString *jpyValue = [NSString stringWithFormat:@"%.2f", jpy];
    double gbp = inputValue * currencies.GBP;
    NSString *gbpValue = [NSString stringWithFormat:@"%.2f", gbp];
    
    self.currencyA.text = eurValue;
    self.currencyB.text = jpyValue;
    self.currencyC.text = gbpValue;
}


@end
