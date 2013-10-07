//
//  StanfordFlickrPhotosTVC.m
//  SPoT
//
//  Created by Karan Shah on 10/1/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import "StanfordFlickrPhotosTVC.h"
#import "StanfordPhotos.h"

@interface StanfordFlickrPhotosTVC ()

@end

@implementation StanfordFlickrPhotosTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    StanfordPhotos *stanfordPhotos = [[StanfordPhotos alloc] init];
    self.photos = stanfordPhotos.spotArray;
//    self.photos = [FlickrFetcher stanfordPhotos];
    NSLog(@"Stanford Photos - %@", self.photos);
}

@end
