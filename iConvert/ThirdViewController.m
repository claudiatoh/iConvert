//
//  ThirdViewController.m
//  iConvert
//  Distance calculator
//  Created by Claudia Toh Yi An on 12/7/16.
//  Copyright © 2016 Claudia Toh. All rights reserved.
//

#import "ThirdViewController.h"
#import <UIKit/UIKit.h>
#import "DistanceGetter/DGDistanceRequest.h"

@interface ThirdViewController ()
@property (nonatomic) DGDistanceRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *startLocation;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak, nonatomic) IBOutlet UITextField *destinationA;
@property (weak, nonatomic) IBOutlet UITextField *destinationB;
@property (weak, nonatomic) IBOutlet UITextField *destinationC;
@property (weak, nonatomic) IBOutlet UITextField *destinationD;
@property (weak, nonatomic) IBOutlet UILabel *distanceA;
@property (weak, nonatomic) IBOutlet UILabel *distanceB;
@property (weak, nonatomic) IBOutlet UILabel *distanceC;
@property (weak, nonatomic) IBOutlet UILabel *distanceD;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@end

@implementation ThirdViewController
- (IBAction)buttonActivated:(id)sender {
    
    self.calculateButton.enabled = NO;
    
    self.req = [DGDistanceRequest alloc];
    NSString *start = self.startLocation.text;
    NSString *destA = self.destinationA.text;
    NSString *destB = self.destinationB.text;
    NSString *destC = self.destinationC.text;
    NSString *destD = self.destinationD.text;
    NSArray *dests=@[destA, destB, destC, destD];
    
    self.req = [self.req initWithLocationDescriptions:dests
                                    sourceDescription:start];
    __weak ThirdViewController *weakSelf = self;
    self.req.callback = ^void(NSArray *responses){
        ThirdViewController *strongSelf = weakSelf;
        if(!strongSelf) return;
        
        NSNull *badResult =[NSNull null];
        if (responses[0] != badResult){
            double num;
            if (strongSelf.segmentController.selectedSegmentIndex==0){
                num = ([responses[0] floatValue]/1.0);
                
                NSString *x =[NSString stringWithFormat:@"%.2f m", num];
                strongSelf.distanceA.text = x;
            }
            else if(strongSelf.segmentController.selectedSegmentIndex==1){
                num = ([responses[0] floatValue]/1000.0);
                
                NSString *x =[NSString stringWithFormat:@"%.2f km", num];
                strongSelf.distanceA.text = x;
                
            }
            else{
                num = ([responses[0] floatValue]/1609.34);
                
                NSString *x =[NSString stringWithFormat:@"%.2f miles", num];
                strongSelf.distanceA.text = x;
                
            }
        }
        else{
            strongSelf.distanceA.text = @"Error";
            
        }//end of calculation for the first destination.
        
        if (responses[1] != badResult){
            double num;
            if (strongSelf.segmentController.selectedSegmentIndex==0){
                num = ([responses[1] floatValue]/1.0);
                
                NSString *x =[NSString stringWithFormat:@"%.2f m", num];
                strongSelf.distanceB.text = x;
            }
            else if(strongSelf.segmentController.selectedSegmentIndex==1){
                num = ([responses[1] floatValue]/1000.0);
                
                NSString *x =[NSString stringWithFormat:@"%.2f km", num];
                strongSelf.distanceB.text = x;
                
            }
            else{
                num = ([responses[1] floatValue]/1609.34);
                
                NSString *x =[NSString stringWithFormat:@"%.2f miles", num];
                strongSelf.distanceB.text = x;
                
            }
        }
        else{
            strongSelf.distanceB.text = @"Error";
            
        }//end of calculation for the second destination.
        
        if (responses[2] != badResult){
            double num;
            if (strongSelf.segmentController.selectedSegmentIndex==0){
                num = ([responses[2] floatValue]/1.0);
                
                NSString *x =[NSString stringWithFormat:@"%.2f m", num];
                strongSelf.distanceC.text = x;
            }
            else if(strongSelf.segmentController.selectedSegmentIndex==1){
                num = ([responses[2] floatValue]/1000.0);
                
                NSString *x =[NSString stringWithFormat:@"%.2f km", num];
                strongSelf.distanceC.text = x;
                
            }
            else{
                num = ([responses[2] floatValue]/1609.34);
                
                NSString *x =[NSString stringWithFormat:@"%.2f miles", num];
                strongSelf.distanceC.text = x;
                
            }
        }
        else{
            strongSelf.distanceC.text = @"Error";
            
        }//end of calculation for the third destination.
        
        if (responses[3] != badResult){
            double num;
            if (strongSelf.segmentController.selectedSegmentIndex==0){
                num = ([responses[3] floatValue]/1.0);
                
                NSString *x =[NSString stringWithFormat:@"%.2f m", num];
                strongSelf.distanceD.text = x;
            }
            else if(strongSelf.segmentController.selectedSegmentIndex==1){
                num = ([responses[3] floatValue]/1000.0);
                
                NSString *x =[NSString stringWithFormat:@"%.2f km", num];
                strongSelf.distanceD.text = x;
                
            }
            else{
                num = ([responses[3] floatValue]/1609.34);
                
                NSString *x =[NSString stringWithFormat:@"%.2f miles", num];
                strongSelf.distanceD.text = x;
                
            }
        }
        else{
            strongSelf.distanceD.text = @"Error";
            
        }
        strongSelf.req = nil;
        strongSelf.calculateButton.enabled = YES;
    };
    [self.req start];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
