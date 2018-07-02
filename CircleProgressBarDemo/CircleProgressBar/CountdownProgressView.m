//
//  CountdownProgressView.m
//  CircleProgressBarDemo
//
//  Created by Ge on 2018/6/26.
//  Copyright © 2018 Kot. All rights reserved.
//

#import "CountdownProgressView.h"

@implementation NSBundle (CircleBundle)

+ (NSBundle *)cd_imagePickerBundle {
    NSBundle *bundle = [NSBundle bundleForClass:[CircleProgressBar class]];
    NSURL *url = [bundle URLForResource:@"CircleProgressBar" withExtension:@"bundle"];
    bundle = [NSBundle bundleWithURL:url];
    return bundle;
}

@end

@implementation UIImage (CircleBundle)

+ (UIImage *)imageNamedFromCircleBundle:(NSString *)name {
    NSBundle *imageBundle = [NSBundle cd_imagePickerBundle];
    name = [name stringByAppendingString:@"@2x"];
    NSString *imagePath = [imageBundle pathForResource:name ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    if (!image) {
        // 兼容业务方自己设置图片的方式
        name = [name stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
        image = [UIImage imageNamed:name];
    }
    return image;
}

@end

const NSInteger DefaultTotalDuration = 60;

@interface CountdownProgressView()

@end

@implementation CountdownProgressView

- (CircleProgressBar *)backCircleProgressBar {
    if (!_backCircleProgressBar) {
        _backCircleProgressBar = [[CircleProgressBar alloc] initWithFrame:self.bounds];
        _backCircleProgressBar.backgroundColor = [UIColor clearColor];
        [_backCircleProgressBar setProgressBarWidth:7.0];
        [_backCircleProgressBar setProgressBarProgressColor:[UIColor whiteColor]];
        [_backCircleProgressBar setProgressBarTrackColor:[UIColor colorWithRed:203.0/255.0 green:167.0/255.0 blue:75.0/255.0 alpha:1]];
        CALayer *maskLayer = [CALayer layer];
        UIImage *mask = [UIImage imageNamedFromCircleBundle:@"countdown"];
        maskLayer.contents = (id)mask.CGImage;
        maskLayer.frame = self.bounds;
        _backCircleProgressBar.layer.mask = maskLayer;
    }
    return _backCircleProgressBar;
}

- (UILabel *)countdownLabel {
    if (!_countdownLabel) {
        _countdownLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _countdownLabel.font = [UIFont systemFontOfSize:(self.bounds.size.width / 2.0)];
        _countdownLabel.textColor = [UIColor colorWithRed:59.0/255.0 green:166.0/255.0 blue:6.0/255.0 alpha:1];
        
        _countdownLabel.text = [NSString stringWithFormat:@"%ld",(long)(_totalDuration == 0 ? DefaultTotalDuration :_totalDuration)];
        _countdownLabel.textAlignment = NSTextAlignmentCenter;
        _countdownLabel.shadowColor = [UIColor colorWithRed:255.0/255.0 green:221.0/255.0 blue:131.0/255.0 alpha:1];
        _countdownLabel.shadowOffset = CGSizeMake(1, 1);
    }
    return _countdownLabel;
}

- (CircleProgressBar *)shadowCircleProgressBar {
    if (!_shadowCircleProgressBar) {
        CGRect frame = self.bounds;
        frame.origin.y += 1;
        frame.origin.x += 1;
        _shadowCircleProgressBar = [[CircleProgressBar alloc] initWithFrame:frame];
        _shadowCircleProgressBar.backgroundColor = [UIColor clearColor];
        [_shadowCircleProgressBar setProgressBarWidth:7.0];
        [_shadowCircleProgressBar setProgressBarProgressColor:[UIColor blueColor]];
        [_shadowCircleProgressBar setProgressBarTrackColor:[UIColor colorWithRed:255.0/255.0 green:221.0/255.0 blue:131.0/255.0 alpha:1]];

        CALayer *maskLayer = [CALayer layer];
        UIImage *mask = [UIImage imageNamedFromCircleBundle:@"countdown"];
        maskLayer.contents = (id)mask.CGImage;
        maskLayer.frame = self.bounds;
        _shadowCircleProgressBar.layer.mask = maskLayer;

    }
    return _shadowCircleProgressBar;
}

- (CircleProgressBar *)foreCircleProgressBar {
    if (!_foreCircleProgressBar) {
        _foreCircleProgressBar = [[CircleProgressBar alloc] initWithFrame:self.bounds];
        _foreCircleProgressBar.backgroundColor = [UIColor clearColor];
        [_foreCircleProgressBar setProgressBarWidth:7.0];
        [_foreCircleProgressBar setProgressBarProgressColor:[UIColor redColor]];
        [_foreCircleProgressBar setProgressBarTrackColor:[UIColor colorWithRed:86.0/255.0 green:136.0/255.0 blue:12.0/255.0 alpha:1]];

        CALayer *maskLayer = [CALayer layer];
        UIImage *mask = [UIImage imageNamedFromCircleBundle:@"countdown"];
        maskLayer.contents = (id)mask.CGImage;
        maskLayer.frame = self.bounds;
        _foreCircleProgressBar.layer.mask = maskLayer;
    }
    return _foreCircleProgressBar;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initUI];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.backCircleProgressBar];
    [self addSubview:self.shadowCircleProgressBar];
    [self addSubview:self.foreCircleProgressBar];
    
    [self addSubview:self.countdownLabel];
}

- (void)setTotalDuration:(NSInteger)totalDuration {
    self.countdownLabel.text = [NSString stringWithFormat:@"%ld",(long)totalDuration];
    _totalDuration = totalDuration;
}

- (void)setDuration:(NSInteger)duration {
    [self updateDuration:duration];
    _duration = duration;
}

- (void)updateDuration:(NSInteger)duration {
    self.countdownLabel.text = [NSString stringWithFormat:@"%ld",(long)duration];
    [self updateProgress:((CGFloat)((_totalDuration == 0 ? DefaultTotalDuration :_totalDuration) - duration)/(CGFloat)_totalDuration)];
}

- (void)updateProgress:(CGFloat)progress {
    [self.foreCircleProgressBar setProgress:progress animated:YES];
    [self.shadowCircleProgressBar setProgress:progress animated:YES];
}

@end
