//
//  TweetCell.m
//  twitter
//
//  Created by abenezermolla on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

#import "Tweet.h"

#import "APIManager.h"

#import "UIImageView+AFNetworking.h" 

@implementation TweetCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}






-(void) refreshData{
    
    
    if(self.tweet.favorited){

   
        [self.likeButton setImage:[UIImage imageNamed: @"favor-icon-red"] forState:UIControlStateNormal];
        
        
    } else{
        
        [self.likeButton setImage:[UIImage imageNamed: @"favor-icon"] forState:UIControlStateNormal];
        

        


        
    }
    




    
    self.nameLabel.text = self.tweet.user.name;
//    
//    //cell.tweetCellView.text = tweetDetail.
//    
    self.tweetDetailLabel.text = self.tweet.text;
//    
//    //cell.profileImageLabel.text =
//    
    self.createdAt.text = self.tweet.createdAtString;
//    
//    //cell.screenName.text  = [NSString stringWithFormat:@"%", tweetDetail.user.screenName];
    NSString *myString = self.tweet.user.screenName;
    
    
//
    NSString *test = [NSString stringWithFormat:@"@%@", myString];
//
    self.screenName.text  = test;
//
    self.nameLabel.text = self.tweet.user.name;
////
//// cell.shareCounter.text = [NSString stringWithFormat:@"$%.2d", tweetDetail.];
//

    
    self.favoriteCounter.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    
//    self.shareTweetCounter.text = @""; // I will need to edit this one later.
    
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    //NSData *urlData = [NSData dataWithContentsOfURL:url];
    
    //cell.profileImageLabel.image = tweetDetail.user.profilePicture;
    
    [self.profileImageLabel setImageWithURL:url];
    
    

    
    
}



-(void) refreshDataForRetweet{
    
    
    if(self.tweet.retweeted){

   
        [self.retweetButton setImage:[UIImage imageNamed: @"retweet-icon-green"] forState:UIControlStateNormal];
        
        
    } else{
        
        [self.retweetButton setImage:[UIImage imageNamed: @"retweet-icon"] forState:UIControlStateNormal];
        
   
    }
    
    self.retweetCounter.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    


    
    
    self.nameLabel.text = self.tweet.user.name;
//
//    //cell.tweetCellView.text = tweetDetail.
//
    self.tweetDetailLabel.text = self.tweet.text;
//
//    //cell.profileImageLabel.text =
//
    self.createdAt.text = self.tweet.createdAtString;
//
//    //cell.screenName.text  = [NSString stringWithFormat:@"%", tweetDetail.user.screenName];
    NSString *myString = self.tweet.user.screenName;
    
    
//
    NSString *test = [NSString stringWithFormat:@"@%@", myString];
//
    self.screenName.text  = test;
//
    self.nameLabel.text = self.tweet.user.name;
////

//

    
    self.retweetCounter.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    
//    self.shareTweetCounter.text = @""; // I will need to edit this one later.
    
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    //NSData *urlData = [NSData dataWithContentsOfURL:url];
    

    
    [self.profileImageLabel setImageWithURL:url];
    
}


- (IBAction)didTapRetweet:(id)sender {
    

    if(self.tweet.retweeted){
        NSLog(@"IF RETWEETED");

    //API Function
//
        [[APIManager shared] unretweetText:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
//
//
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
//
//
                self.tweet.retweeted = NO;
                self.tweet.retweetCount -=1;
                [self refreshDataForRetweet];
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

    [[APIManager shared] retweetText:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
             NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully retweeted the following Tweet: %@", tweet);
            //[self.likeButton setImage:[UIImage imageNamed: @"favor-icon-red"] forState:UIControlStateNormal];
            
            self.tweet.retweeted = YES;
            self.tweet.retweetCount += 1;
            [self refreshDataForRetweet];
            
            
           }
        
        
    }];
    
    


}

//    self.tweet.retweeted = YES;
//
//    self.tweet.retweetCount +=1;
    
    
}



- (IBAction)didTapFavorite:(id)sender {
    
 
    if(self.tweet.favorited){

    
  
    //API Function
        
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
                
                
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet);

                
                self.tweet.favorited = NO;
                self.tweet.favoriteCount -=1;
                [self refreshData];
                
                
               }
            
            
        }];
}
else{
   
    //Favorite the tweet

    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
             NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", tweet);
            //[self.likeButton setImage:[UIImage imageNamed: @"favor-icon-red"] forState:UIControlStateNormal];
            
            self.tweet.favorited = YES;
            self.tweet.favoriteCount += 1;
            [self refreshData];
            
            
           }
        
        
    }];
    
             }
    
    
 

    
 
}



@end
