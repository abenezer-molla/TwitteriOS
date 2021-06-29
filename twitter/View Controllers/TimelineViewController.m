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


@interface TimelineViewController () < UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *arrayOfTweets;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    // Get timeline
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
    
    cell.nameLabel.text = tweetDetail.user.name;
    
    //cell.tweetCellView.text = tweetDetail.
    
    cell.tweetDetailLabel.text = tweetDetail.text;
    
    //cell.profileImageLabel.text =
    
    cell.createdAt.text = tweetDetail.createdAtString;
    
    cell.screenName.text  = tweetDetail.user.screenName;
    
    cell.nameLabel.text = tweetDetail.user.name;
    
    
    cell.retweetCounter.text = [NSString stringWithFormat:@"$%.2d", tweetDetail.retweetCount];
    
    cell.favoriteCounter.text = [NSString stringWithFormat:@"$%.2d", tweetDetail.favoriteCount];
    
  
    
    NSString *URLString = tweetDetail.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];

    
    /*
    cell.profileImageLabel.text =
    
    cell.profileImageLabel.text =
    
    cell.shareTweetLabel.text =
    
    cell.retweetLabel.text =
    
    cell.likeTweetLabel.text =
    
    cell.messagePeopleLabel.text =
     
     */
    
    
    
    
    
   
    
    
    
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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end
