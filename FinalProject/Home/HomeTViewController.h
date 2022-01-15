//
//  HomeTViewController.h
//  FinalProject
//
//  Created by esraa on 1/7/22.
//  Copyright © 2022 esraa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeleteMeProtocol.h"
#import "Movie.h"
#import "NetworkManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeTViewController : UITableViewController<NSURLConnectionDelegate,NSURLConnectionDataDelegate,DeleteMeProtocol>
@property NetworkManager *networkManager;
@property NSMutableData *responseData;
@property NSMutableArray * movies;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray* movieee;
@end

NS_ASSUME_NONNULL_END
