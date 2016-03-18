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
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.image = [UIImage imageNamed:@"banner"];
        [self addSubview:self.imageView];
    }
    return self;
}

//根据外部传入的偏移量，修改imageView的frame
- (void)amplifyingWithContentOffset:(CGPoint)contentOffset {
    if (contentOffset.y < 0) {
        CGRect frame = self.imageView.frame;
        frame.origin.y = contentOffset.y;
        CGFloat newHeight = PullDownViewHeight - contentOffset.y;
        frame.size.height = newHeight;
        //确保imageView的宽高等比例缩放
        frame.size.width = [UIScreen mainScreen].bounds.size.width * (newHeight / PullDownViewHeight);
        self.imageView.frame = frame;
    }
}

@end
