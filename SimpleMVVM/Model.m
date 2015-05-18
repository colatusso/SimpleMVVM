//
//  Model.m
//  SimpleMVVM
//
//  Created by Rafael on 18/05/15.
//  Copyright (c) 2015 RightCloud. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (id)sharedInstance {
    // this prevents duplicated instances and create a shared one
    // ideal when working with databases
    
    static Model *data = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        data = [[self alloc] init];
    });
    
    return data;
}

- (id)init {
    self = [super init];
    
    if (self) {
        // do your initialization stuff here
    }
    
    return self;
}

- (NSArray *)loadData {
    return @[@"first", @"second", @"third"];
}

@end
