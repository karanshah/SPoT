//
//  FlickrPhotoTVC.h
//  SPoT
//
//  Created by Karan Shah on 9/29/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//
// Will call setImageURL: as  part of any "Show Image" segue.

#import <UIKit/UIKit.h>

@interface FlickrPhotoTVC : UITableViewController

@property (nonatomic, strong) NSArray *photos;  // of NSDictionary

@end
