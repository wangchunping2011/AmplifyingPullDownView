//
//  AmplifyingPullDownView.m
//  TestDemo
//
//  Created by 王春平 on 16/3/16.
//  Copyright © 2016年 wang. All rights reserved.
//

#import "AmplifyingPullDownView.h"

@interface AmplifyingPullDownView ()

//下拉放大图片所在视图
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation AmplifyingPullDownView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //保证图片在放大的过程中，高和宽等比例放大
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.image = [UIImage imageNamed:@"banner"];
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)amplifyingWithContentOffset:(CGPoint)contentOffset {
    if (contentOffset.y < 0) {
        CGRect frame = self.imageView.frame;
        frame.origin.y = contentOffset.y;
        frame.size.height = PullDownViewHeight - contentOffset.y;
        self.imageView.frame = frame;
    }
}

@end
