//
//  CountdownProgressView.h
//  CircleProgressBarDemo
//
//  Created by Ge on 2018/6/26.
//  Copyright © 2018 Kot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleProgressBar.h"

@interface CountdownProgressView : UIView

@property (strong, nonatomic) CircleProgressBar *backCircleProgressBar;
@property (strong, nonatomic) CircleProgressBar *shadowCircleProgressBar;
@property (strong, nonatomic) CircleProgressBar *foreCircleProgressBar;
@property (strong, nonatomic) UILabel *countdownLabel;

@property (assign, nonatomic) NSInteger totalDuration;
@property (assign, nonatomic) NSInteger duration;

- (void)updateDuration:(NSInteger)duration;

@end
