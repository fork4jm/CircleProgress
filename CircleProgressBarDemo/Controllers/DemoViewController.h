//
//  ViewController.h
//  CircleProgressBar
//
//  Created by Ge on 3/15/15.
//  Copyright (c) 2015 Kot. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountdownProgressView;

typedef enum : NSUInteger {
    CustomizationStateDefault = 0,
    CustomizationStateCustom,
    CustomizationStateCustomAttributed,
} CustomizationState;

@interface DemoViewController : UIViewController

@property (weak, nonatomic) IBOutlet CountdownProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *customizeButton;

- (IBAction)increaseProgress:(id)sender;
- (IBAction)decreaseProgress:(id)sender;
- (IBAction)customizeNext:(id)sender;

@end

