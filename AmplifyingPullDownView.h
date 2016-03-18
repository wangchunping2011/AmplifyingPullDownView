//
//  AmplifyingPullDownView.h
//  TestDemo
//
//  Created by 王春平 on 16/3/16.
//  Copyright © 2016年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AmplifyingPullDownView : UIView

//外部调用时，把scrollView的contentOffset赋值给此方法的参数
- (void)amplifyingWithContentOffset:(CGPoint)contentOffset;

@end
