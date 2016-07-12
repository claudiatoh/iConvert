//
//  FirstViewController.m
//  iConvert
//
//  Created by Claudia Toh Yi An on 12/7/16.
//  Copyright © 2016 Claudia Toh. All rights reserved.
//

#import "FirstViewController.h"

double ConvertUnitOneToUnitTwo(double UnitOneValue){
    double UnitTwoValue;
    UnitTwoValue = UnitOneValue/(1/0.393701);
    return UnitTwoValue;
}//Converts cm to Inches
double ConvertUnitOneToUnitThree(double UnitOneValue){
    double UnitThreeValue;
    UnitThreeValue = UnitOneValue/(1/0.0328084);
    return UnitThreeValue;
}//Converts cm to Foot
double ConvertUnitOneToUnitFour(double UnitOneValue){
    double UnitFourValue;
    UnitFourValue = UnitOneValue/(1/0.01);
    return UnitFourValue;
}//Converts cm to Meters

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UILabel *outputField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updateButton:(id)sender {
    NSMutableString *buf = [NSMutableString new];
    //stores a new string.
    double userInput = [self.inputField.text doubleValue];
    //retrieves value from user and stores it in UserInput
    if (self.segmentController.selectedSegmentIndex == 0){
        double UnitTwoValue = ConvertUnitOneToUnitTwo(userInput);
        [buf appendString: [@(UnitTwoValue) stringValue]];
    }
    else if (self.segmentController.selectedSegmentIndex == 1){
        double UnitThreeValue = ConvertUnitOneToUnitThree(userInput);
        [buf appendString: [@(UnitThreeValue) stringValue]];
    }
    else{
        double UnitFourValue = ConvertUnitOneToUnitFour(userInput);
        [buf appendString: [@(UnitFourValue) stringValue]];
    }
    self.outputField.text = buf;
}

@end
