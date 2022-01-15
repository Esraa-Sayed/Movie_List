//
//  HomeTViewController.m
//  FinalProject
//
//  Created by esraa on 1/7/22.
//  Copyright © 2022 esraa. All rights reserved.
//

#import "HomeTViewController.h"
#import <SDWebImage/SDWebImage.h>
#import "Movie.h"
#import "DetailsViewController.h"
@interface HomeTViewController ()


@end

@implementation HomeTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _movies = [NSMutableArray new];
    _networkManager = [NetworkManager new];
       [_networkManager getAllMovies:self];
    
}

#pragma mark - Table view data source

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _responseData = [[NSMutableData alloc]init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_responseData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
     NSDictionary *movieDict = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingAllowFragments error:nil];
    NSArray *d = [movieDict objectForKey:@"items"];
    for(int i =0;i<d.count;i++)
    {
        Movie*movie = [self convertDictionaryToMovie:[d objectAtIndex:i]];
        [_movies addObject:movie];
    }
    [self.tableView reloadData];
    

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _movies.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Movie *movie = _movies[indexPath.row];
    cell.textLabel.text = movie.title;
    
    NSString* image_str = movie.image;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:image_str]];
    cell.imageView.layer.cornerRadius = 28;
    cell.imageView.layer.masksToBounds = true;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((DetailsViewController *)segue.destinationViewController).movie = _movies[self.tableView.indexPathForSelectedRow.row];
    ((DetailsViewController *)segue.destinationViewController).HomeVC = self;
    
}
-(Movie*)convertDictionaryToMovie:(NSDictionary*)current_dict
{
    Movie *movie = [Movie new];
    movie.title = [current_dict objectForKey:@"title"];
    movie.image = [current_dict objectForKey:@"image"];
    movie.gross = [current_dict objectForKey:@"gross"];
    movie.rank = [current_dict objectForKey:@"rank"];
    movie.weekend = [current_dict objectForKey:@"weekend"];
    movie.weeks = [current_dict objectForKey:@"weeks"];
    
    return  movie;
}
- (void)deleteMovie:(Movie *)movie
{
    [_movies removeObject:movie];
    [self.tableView reloadData];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
