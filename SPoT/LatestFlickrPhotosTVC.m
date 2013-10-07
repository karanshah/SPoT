//
//  LatestFlickrPhotosTVC.m
//  SPoT
//
//  Created by Karan Shah on 9/29/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import "LatestFlickrPhotosTVC.h"
#import "FlickrFetcher.h"

@interface LatestFlickrPhotosTVC ()

@end

@implementation LatestFlickrPhotosTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.photos = [FlickrFetcher stanfordPhotos];
    NSLog(@"Stanford Photos - %@", self.photos);
}



@end
