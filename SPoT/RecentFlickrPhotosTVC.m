//
//  RecentFlickrPhotosTVC.m
//  SPoT
//
//  Created by Karan Shah on 10/12/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import "RecentFlickrPhotosTVC.h"
#import "RecentPhotos.h"

@interface RecentFlickrPhotosTVC ()

@end

@implementation RecentFlickrPhotosTVC


- (void)updateUI {
    self.photos = [RecentPhotos allRecentPhotos];
    
}

#pragma mark - View Controller Lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)setup
{
    // initialization that can't wait until viewDidLoad
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.photos = [RecentPhotos allRecentPhotos];
    NSLog(@"Recent Photos - %@", self.photos);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
