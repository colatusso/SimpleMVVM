//
//  Model.h
//  SimpleMVVM
//
//  Created by Rafael on 18/05/15.
//  Copyright (c) 2015 RightCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

+ (id)sharedInstance;
- (void)loadData;

@property (strong, nonatomic) NSArray *dataArray;

@end
