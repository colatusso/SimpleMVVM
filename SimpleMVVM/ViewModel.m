//
//  ViewModel.m
//  SimpleMVVM
//
//  Created by Rafael on 18/05/15.
//  Copyright (c) 2015 RightCloud. All rights reserved.
//

#import "ViewModel.h"
#import "Model.h"

@interface ViewModel ()

@end

@implementation ViewModel

+ (id)sharedInstanceWithViewController:(ViewController *)viewController {
    // this prevents duplicated instances and create a shared one
    
    static ViewModel *viewModel = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        viewModel = [[self alloc] initWithViewController:(ViewController *)viewController];
    });
    
    return viewModel;
}

- (id) initWithViewController:(ViewController*)viewController {
    self = [super init];
    
    if (self) {
        self.viewController = viewController;
        
        /*
           normally you would set the initial data here, but since I added KVC/KVO NSKeyValueObservingOptionInitial there is no need for this, but it would be like:
           self.viewController.data = [self.model methodThatReturnsData]; 
        */
        
        // shared instance of the model, the data is lodaded inside the class initialization
        self.model = [Model sharedInstance];
        
        // setting new values after 3 seconds, just for the sake of this example! Observed with NSKeyValueObservingOptionNew
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.model setNewData];
        });
    }
    
    return self;
}


@end
