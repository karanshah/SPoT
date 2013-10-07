//
//  Photo.h
//  SPoT
//
//  Created by Karan Shah on 10/6/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *photoId;
@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, strong) NSURL *url;

@end
