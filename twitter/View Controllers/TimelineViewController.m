//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Tweet.h"
#import "TweetCell.h"

#import "DetailsViewController.h"

#import "UIImageView+AFNetworking.h"

#import "composeViewController.h"


@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *arrayOfTweets;


@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) UIRefreshControl *refreshControl; 
@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    
    
    [self fetchTimeLine];
    
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    [self.refreshControl addTarget:self action:@selector(fetchTimeLine) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addSubview:self.refreshControl];
    
    
    // Get timeline
    

    
    
    


    
}

- (void)fetchTimeLine {
    
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            //for (NSDictionary *dictionary in tweets) {
                //NSString *text = dictionary[@"text"];
                //NSLog(@"%@", text);
            [self.tableView reloadData];
            
        
            
           // }
            self.arrayOfTweets = (NSMutableArray*) tweets;
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        
        [self.refreshControl endRefreshing];
    }];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAction:(id)sender {
    
    NSLog(@"Hello");

}

- (IBAction)logoutButtonTap:(UIButton *)sender {
    
    
    // TimelineViewController.m

    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    
    NSLog(@"Aben Clicked!");

    [[APIManager shared] logout];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    Tweet *tweetDetail = self.arrayOfTweets[indexPath.row];
    
    if(tweetDetail.favorited){
        
        [cell.likeButton setImage:[UIImage imageNamed: @"favor-icon-red"] forState:UIControlStateNormal];
        
        
    } else{
        
        [cell.likeButton setImage:[UIImage imageNamed: @"favor-icon"] forState:UIControlStateNormal];
        
        
        
    }
    
    if(tweetDetail.retweeted){
        
        [cell.retweetButton setImage:[UIImage imageNamed: @"retweet-icon-green"] forState:UIControlStateNormal];
        
        
    } else{
        
        [cell.retweetButton  setImage:[UIImage imageNamed: @"retweet-icon"] forState:UIControlStateNormal];
        
        
        
    }
    
    
    
    cell.nameLabel.text = tweetDetail.user.name;
    
    //cell.tweetCellView.text = tweetDetail.
    
    cell.tweetDetailLabel.text = tweetDetail.text;
    
    //cell.profileImageLabel.text =
    
    cell.createdAt.text = tweetDetail.createdAtString;
    
    //cell.screenName.text  = [NSString stringWithFormat:@"%", tweetDetail.user.screenName];
    NSString *myString = tweetDetail.user.screenName;
    
    
    
    NSString *test = [NSString stringWithFormat:@"@%@", myString];
    
    cell.screenName.text  = test;
    
    cell.nameLabel.text = tweetDetail.user.name;
//
//    cell.shareCounter.text = [NSString stringWithFormat:@"$%.2d", tweetDetail.];
    
    
    cell.retweetCounter.text = [NSString stringWithFormat:@"%.1d", tweetDetail.retweetCount];
    
    cell.favoriteCounter.text = [NSString stringWithFormat:@"%.1d", tweetDetail.favoriteCount];
    
    cell.shareTweetCounter.text = @""; // I will need to edit this one later.
    
    NSString *URLString = tweetDetail.user.profilePicture;
    
    NSString *stringWithoutSpaces = [URLString
       stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
    NSURL *url = [NSURL URLWithString:stringWithoutSpaces];
    //NSData *urlData = [NSData dataWithContentsOfURL:url];
    
    //cell.profileImageLabel.image = tweetDetail.user.profilePicture;
    
    [cell.profileImageLabel setImageWithURL:url];


    
    cell.tweet = tweetDetail;
    
    return cell;
    
}


/*
 
 
 @property (weak, nonatomic) IBOutlet UIView *tweetCellView;
 @property (weak, nonatomic) IBOutlet UILabel *nameLabel;
 @property (weak, nonatomic) IBOutlet UILabel *tweetDetailLabel;
 @property (weak, nonatomic) IBOutlet UIImageView *profileImageLabel;
 @property (weak, nonatomic) IBOutlet UIImageView *shareTweetLabel;
 @property (weak, nonatomic) IBOutlet UIImageView *retweetLabel;
 @property (weak, nonatomic) IBOutlet UIImageView *likeTweetLabel;
 @property (weak, nonatomic) IBOutlet UIImageView *messagePeopleLabel;
 
 
 */





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"segueTweet"]){
        
        UINavigationController *navigationController = [segue destinationViewController];
        composeViewController *composeController = (composeViewController*)navigationController.topViewController;
        composeController.delegate = self;
    } else if([segue.identifier isEqualToString:@"segueDetail"]){
        
        
        
//
//        NSLog(@"Tapping on a movie");
//
//        UITableViewCell *tappedCell = sender;
//
//
//        NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
//
//        NSDictionary *movie  = self.movies[indexPath.row];
//
//        DetailsViewController *detailsViewController  = [segue destinationViewController];
//
//        detailsViewController.movie = movie;
        
        
        
  
            NSLog(@"Tapping on a movie");
            
            TweetCell *tappedCell = sender;
            
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
            
            NSDictionary *composedTweet  = self.arrayOfTweets[indexPath.row];
            
            DetailsViewController *detailsViewController  = [segue destinationViewController];
            
        detailsViewController.tweetDict = composedTweet;
            
      
    }
}
    
 
    
    
    
    
    //GET BACK HERE TOMORROW FOR DETAIL PAGE
    


- (void) didTweet:(Tweet *)tweet{
    [self.arrayOfTweets insertObject:tweet atIndex:0];
    
    
    [self.tableView reloadData];
    
    
}






@end
