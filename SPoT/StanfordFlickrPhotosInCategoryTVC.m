//
//  StanfordFlickrPhotosInCategoryTVC.m
//  SPoT
//
//  Created by Karan Shah on 10/6/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import "StanfordFlickrPhotosInCategoryTVC.h"

@interface StanfordFlickrPhotosInCategoryTVC ()

@end

@implementation StanfordFlickrPhotosInCategoryTVC

@synthesize photosInCategory = _photosInCategory;

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (self.photosInCategory) {
        self.photos = self.photosInCategory;
    }
}


@end
