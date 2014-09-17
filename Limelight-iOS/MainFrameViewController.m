//
//  MainFrameViewController.m
//  Limelight-iOS
//
//  Created by Diego Waxemberg on 1/17/14.
//  Copyright (c) 2014 Diego Waxemberg. All rights reserved.
//

#import "MainFrameViewController.h"
#import "VideoDepacketizer.h"
#import "ConnectionHandler.h"

@interface MainFrameViewController ()

@end

@implementation MainFrameViewController
static NSString* hostAddr;

+ (const char*)getHostAddr
{
    return [hostAddr UTF8String];
}

- (void)PairButton:(UIButton *)sender
{
    NSLog(@"Pair Button Pressed!");
    hostAddr = self.HostField.text;
    [ConnectionHandler pairWithHost:hostAddr];
}

- (void)StreamButton:(UIButton *)sender
{
    NSLog(@"Stream Button Pressed!");
    hostAddr = self.HostField.text;
    [ConnectionHandler streamWithHost:hostAddr viewController:self];
}

- (void) segueIntoStream {
    [self performSegueWithIdentifier:@"createStreamFrame" sender:self];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.streamConfigVals objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //TODO: figure out how to save this info!!
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.streamConfigVals = [[NSArray alloc] initWithObjects:@"1280x720 (30Hz)",@"1280x720 (60Hz)",@"1920x1080 (30Hz)",@"1920x1080 (60Hz)",nil];
    self.HostField.text = @"neyer.case.edu";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end