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
        
        // shared instance of the model
        self.model = [Model sharedInstance];
    }
    
    return self;
}


@end
