//
//  DetailsViewController.h
//  FinalProject
//
//  Created by esraa on 1/7/22.
//  Copyright © 2022 esraa. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"
#import "DeleteMeProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : ViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *myTitle;
@property Movie *movie;
@property (weak, nonatomic) IBOutlet UILabel *rank;
@property id<DeleteMeProtocol>HomeVC;
@property (weak, nonatomic) IBOutlet UILabel *gross;
@property (weak, nonatomic) IBOutlet UIImageView *movieImg;
@property (weak, nonatomic) IBOutlet UILabel *weeks;
@property (weak, nonatomic) IBOutlet UILabel *weekend;

- (IBAction)delete:(UIBarButtonItem *)sender;

@end

NS_ASSUME_NONNULL_END
