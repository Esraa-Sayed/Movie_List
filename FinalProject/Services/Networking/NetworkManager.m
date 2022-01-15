//
//  NetworkManager.m
//  FinalProject
//
//  Created by esraa on 1/7/22.
//  Copyright © 2022 esraa. All rights reserved.
//

#import "NetworkManager.h"
#import "Key.h"
@implementation NetworkManager
- (void)getAllMovies:(UIViewController *)delegate
{
    NSString* s = [NSString stringWithFormat:@"%@%@",@"https://imdb-api.com/en/API/BoxOffice/",[Key getKey]];
    NSURL *url = [NSURL URLWithString:s];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:delegate];
    [conn start];
}
@end
