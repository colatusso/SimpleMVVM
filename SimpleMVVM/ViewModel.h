//
//  ViewModel.h
//  SimpleMVVM
//
//  Created by Rafael on 18/05/15.
//  Copyright (c) 2015 RightCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Model.h"

@class UIViewController;

@interface ViewModel : NSObject

+ (id)sharedInstanceWithViewController:(ViewController *)viewController;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) Model *model;

@end
