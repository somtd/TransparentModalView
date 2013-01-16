//
//  TRContainerViewController.m
//  TransparentModalView
//
//  Created by SOMTD on 2013/01/16.
//  Copyright (c) 2013年 SOMTD. All rights reserved.
//

#import "TRContainerViewController.h"


@interface TRContainerViewController ()
{
    UIImageView *_navBar;
    UILabel *_navTitleLabel;
    UIImageView *_toolBar;
    UIButton *_modalButton;
}

@end

@implementation TRContainerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _containerAppearFrame = self.view.bounds;
    _containerHiddenFrame = CGRectMake(0, CGRectGetMaxY(self.view.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
        
    _container.frame = self.view.bounds;
    _container.userInteractionEnabled = NO;
    [self.view addSubview:_container];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)aViewController animated:(BOOL)animated
{
    //[self buttonIntractionDisanabled];

    [self addChildViewController:aViewController];
    [aViewController willMoveToParentViewController:self];
    _visibleViewController = aViewController;
    
    [_container addSubview:_visibleViewController.view];
    _visibleViewController.view.frame = _containerHiddenFrame;
    
    [UIView animateWithDuration:0.3f animations:^{
        _visibleViewController.view.frame = _containerAppearFrame;
    } completion:^(BOOL finished) {
        [_visibleViewController didMoveToParentViewController:self];
        _container.userInteractionEnabled = YES;
    }];
    
}

- (void)popViewController:(BOOL)animated
{
    if (_visibleViewController)
    {
        [_visibleViewController willMoveToParentViewController:nil];
        _container.userInteractionEnabled = NO;
        
        [UIView animateWithDuration:0.3f animations:^{
            _visibleViewController.view.frame = _containerHiddenFrame;
        } completion:^(BOOL finished) {
            [_visibleViewController didMoveToParentViewController:nil];
            [_visibleViewController.view removeFromSuperview];
            [_visibleViewController removeFromParentViewController];
            //[self buttonIntractionEnabled];
        }];
    }
}


@end
