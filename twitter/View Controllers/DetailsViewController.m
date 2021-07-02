//
//  DetailsViewController.m
//  twitter
//
//  Created by abenezermolla on 7/1/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"

#import "UIImageView+AFNetworking.h"

#import "DateTools.h"

#import "APIManager.h"

#import "TweetCell.h"

#import "Tweet.h"

#import "DateTools.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePictureView;
@property (weak, nonatomic) IBOutlet UILabel *profileNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileUsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileTweetText;
@property (weak, nonatomic) IBOutlet UIButton *likeButtonDetail;
@property (weak, nonatomic) IBOutlet UIButton *retweetButtonDetail;
@property (weak, nonatomic) IBOutlet UILabel *profileDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeDetailCounter;
@property (weak, nonatomic) IBOutlet UILabel *retweetDetailCount;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];

    dateFormat.dateFormat = @"E MMM d HH:mm:ss Z y";
  
    NSString *createdDate = self.tweetDict.originalDate;
    NSDate *date = [dateFormat dateFromString:createdDate];
    
    NSString *URLString = self.tweetDict.user.profilePicture;
    
    NSString *stringWithoutSpaces = [URLString
       stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
    NSURL *url = [NSURL URLWithString:stringWithoutSpaces];
    //NSData *urlData = [NSData dataWithContentsOfURL:url];
    
    //cell.profileImageLabel.image = tweetDetail.user.profilePicture;
    
    [self.profilePictureView setImageWithURL:url];
    
    self.profileNameLabel.text = self.tweetDict.user.name;
    self.profileTweetText.text = self.tweetDict.text;
    self.profileUsernameLabel.text = self.tweetDict.user.screenName;
    self.profileDateLabel.text = date.shortTimeAgoSinceNow;
    
    self.retweetDetailCount.text = [NSString stringWithFormat:@"%d", self.tweetDict.retweetCount];
    self.likeDetailCounter.text = [NSString stringWithFormat:@"%d", self.tweetDict.favoriteCount];
    
    NSLog(@"%@", self.tweetDetail2.idStr);
    
   
    

}




//////





-(void) refreshDataDetail{
    
    
    if(self.tweetDetail2.favorited){

   
        [self.likeButtonDetail setImage:[UIImage imageNamed: @"favor-icon-red"] forState:UIControlStateNormal];
        
        
    } else{
        
        [self.likeButtonDetail setImage:[UIImage imageNamed: @"favor-icon"] forState:UIControlStateNormal];
        

        


        
    }
    


    self.profileNameLabel.text = self.tweetDetail2.user.name;
//
//    //cell.tweetCellView.text = tweetDetail.
//
    self.profileTweetText.text = self.tweetDetail2.text;
//


    
    self.retweetDetailCount.text = [NSString stringWithFormat:@"%d", self.tweetDetail2.retweetCount];
    

    NSString *myString = self.tweetDetail2.user.screenName;
    
    
//
    NSString *test = [NSString stringWithFormat:@"@%@", myString];
//
    self.profileUsernameLabel.text  = test;
//
    self.profileNameLabel.text = self.tweetDetail2.user.name;
////
   
}




-(void) refreshDataDetailRetweet{
    
    
    if(self.tweetDetail2.retweeted){

   
        [self.retweetButtonDetail setImage:[UIImage imageNamed: @"retweet-icon-green"] forState:UIControlStateNormal];
        
        
    } else{
        
        [self.likeButtonDetail setImage:[UIImage imageNamed: @"retweet-icon"] forState:UIControlStateNormal];
        

        


        
    }
    


    self.profileNameLabel.text = self.tweetDetail2.user.name;
//
//    //cell.tweetCellView.text = tweetDetail.
//
    self.profileTweetText.text = self.tweetDetail2.text;
//


    
    
    
    //self.createdAt.text = newDate;

//
//    //cell.screenName.text  = [NSString stringWithFormat:@"%", tweetDetail.user.screenName];
    NSString *myString = self.tweetDetail2.user.screenName;
    
    self.likeDetailCounter.text = [NSString stringWithFormat:@"%d", self.tweetDetail2.favoriteCount];
//
    NSString *test = [NSString stringWithFormat:@"@%@", myString];
//
    self.profileUsernameLabel.text  = test;
//
    self.profileNameLabel.text = self.tweetDetail2.user.name;
////
   
}







- (IBAction)likeActionDetail:(id)sender {
    
}

- (IBAction)retweetActionDetail:(id)sender {
    
    
    
    if(self.tweetDetail2.retweeted){
        NSLog(@"IF RETWEETED");

    //API Function
//
        [[APIManager shared] unretweetText:self.tweetDetail2 completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
//
//
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
//
//
                self.tweetDetail2.retweeted = NO;
                self.tweetDetail2.retweetCount -=1;
                [self refreshDataDetailRetweet];
//
//
               }
//
//
        }];
}
else{
    NSLog(@"IF NOT RETWEETED");
    //Favorite the tweet

    [[APIManager shared] retweetText:self.tweetDetail2 completion:^(Tweet *tweet, NSError *error) {
        if(error){
             NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully retweeted the following Tweet: %@", tweet);
            //[self.likeButton setImage:[UIImage imageNamed: @"favor-icon-red"] forState:UIControlStateNormal];
            
            self.tweetDict.retweeted = YES;
            self.tweetDict.retweetCount += 1;
            [self refreshDataDetailRetweet];
            
            
           }
        
        
    }];
    
    


    
    
    
    
    
}
    
}


    

    


    
    
    


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
    


@end
    
