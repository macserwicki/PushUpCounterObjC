//
//  ViewController.m
//  PushUpCounter
//
//  Created by Maciej Serwicki on 6/2/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pushUpsCountLbl;
@property (weak, nonatomic) IBOutlet UIButton *doneBtnOutlet;
@property (weak, nonatomic) IBOutlet UILabel *infoLbl;
@property (weak, nonatomic) IBOutlet UIButton *pushUpCountBtnOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *coinImg;
@property (weak, nonatomic) IBOutlet UILabel *howManyPushupsLbl;
@property (weak, nonatomic) IBOutlet UITextField *numberOfPushupsTxtField;
@property (weak, nonatomic) IBOutlet UIButton *startBtnOutlet;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _doneBtnOutlet.hidden = YES;
    _infoLbl.hidden = YES;
    _coinImg.hidden = YES;
    _pushUpsCountLbl.hidden = YES;
    _pushUpCountBtnOutlet.hidden = YES;
    
    self.pushUpCount = [NSNumber numberWithInt:0];
    self.pushUpGoal = [NSNumber numberWithInt: 0];
        
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushUpBtnPressed:(UIButton *)sender {
    
    _pushUpCount = [NSNumber numberWithInt:[_pushUpCount intValue] + 1];
    
    NSString *string = [NSString stringWithFormat:@"%@", [_pushUpCount stringValue]];
    
    if ([_pushUpGoal intValue] <= [_pushUpCount intValue]) {
        //You win!
        _coinImg.hidden = NO;
    } else {
        _coinImg.hidden = YES;
    }
    
    _pushUpsCountLbl.text = [NSString stringWithFormat:@"%@ Push Ups",string];
}


- (IBAction)doneBtnPressed:(UIButton *)sender {
    _doneBtnOutlet.hidden = YES;
    _infoLbl.hidden = YES;
    _coinImg.hidden = YES;
    _pushUpsCountLbl.hidden = YES;
    _pushUpCountBtnOutlet.hidden = YES;
    
    _startBtnOutlet.hidden = NO;
    _numberOfPushupsTxtField.hidden = NO;
    _howManyPushupsLbl.hidden = NO;
    
    self.pushUpCount = [NSNumber numberWithInt:0];
    
    _pushUpsCountLbl.text = [NSString stringWithFormat:@"%@ Push Ups", [_pushUpCount stringValue]];
    _numberOfPushupsTxtField.text = @"";
}


- (IBAction)startBtnPressed:(UIButton *)sender {
    
    _doneBtnOutlet.hidden = NO;
    _infoLbl.hidden = NO;
    _pushUpsCountLbl.hidden = NO;
    _pushUpCountBtnOutlet.hidden = NO;
    
    _startBtnOutlet.hidden = YES;
    _numberOfPushupsTxtField.hidden = YES;
    _howManyPushupsLbl.hidden = YES;

    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *number = [f numberFromString: self.numberOfPushupsTxtField.text];
    self.pushUpGoal = number;
    [self.view endEditing:YES];

    
}


@end
