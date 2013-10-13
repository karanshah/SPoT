//
//  Photo.m
//  SPoT
//
//  Created by Karan Shah on 10/6/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import "Photo.h"

@implementation Photo

@synthesize title = _title;
@synthesize description = _description;
@synthesize photoId = _photoId;
@synthesize dictionary = _dictionary;
@synthesize url = _url;

- (NSArray *) getSortedDictionaryValues {
    NSArray *sortedValues = [NSArray array];
    if(self.dictionary) {
        NSMutableArray *unsortedValues = [[NSMutableArray alloc] initWithArray:[self.dictionary allValues]];
        NSSortDescriptor *descriptors = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
        sortedValues = [unsortedValues sortedArrayUsingDescriptors:@[descriptors]];
    }
    return sortedValues;
}

@end
