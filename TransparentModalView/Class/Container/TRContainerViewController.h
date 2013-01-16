//
//  TRContainerViewController.h
//  TransparentModalView
//
//  Created by SOMTD on 2013/01/16.
//  Copyright (c) 2013年 SOMTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface TRContainerViewController : UIViewController
{
    UIView *_container;
    UIViewController *_visibleViewController;
    
    CGRect _containerAppearFrame;
    CGRect _containerHiddenFrame;
}
- (void)pushViewController:(UIViewController *)aViewController animated:(BOOL)animated;
- (void)popViewController:(BOOL)animated;


@end
