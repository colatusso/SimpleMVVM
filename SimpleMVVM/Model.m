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
        // loading the initial data via KVC
        [self loadData];
        
        // do your initialization stuff here
        
    }
    
    return self;
}

- (void)loadData {
    // setting the initial data, observed with NSKeyValueObservingOptionInitial
    [self setValue:@[@"first", @"second", @"third"] forKey:@"dataArray"];
}

- (void)setNewData {
    [self setValue:@[@"FIRST", @"SECOND", @"THIRD"] forKey:@"dataArray"];
}

@end
