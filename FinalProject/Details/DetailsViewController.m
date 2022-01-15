//
//  DetailsViewController.m
//  FinalProject
//
//  Created by esraa on 1/7/22.
//  Copyright © 2022 esraa. All rights reserved.
//

#import "DetailsViewController.h"
#import <SDWebImage/SDWebImage.h>
@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _rank.text = _movie.rank;
    _gross.text = _movie.gross;
    _weeks.text = _movie.weeks;
    _weekend.text = _movie.weekend;
    _myTitle.title = _movie.title;
    [_movieImg sd_setImageWithURL:[NSURL URLWithString:_movie.image]];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)delete:(UIBarButtonItem *)sender {
    [_HomeVC deleteMovie:_movie];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
