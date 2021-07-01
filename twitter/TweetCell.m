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
    
    //cell.tweetCellView.text = tweetDetail.
    
    self.tweetDetailLabel.text = self.tweet.text;
    
    //cell.profileImageLabel.text =
    
    self.createdAt.text = self.tweet.createdAtString;
    
    //cell.screenName.text  = [NSString stringWithFormat:@"%", tweetDetail.user.screenName];
    NSString *myString = self.tweet.user.screenName;
    
    
    
    NSString *test = [NSString stringWithFormat:@"@%@", myString];
    
    self.screenName.text  = test;
    
    self.nameLabel.text = self.tweet.user.name;
//
//    cell.shareCounter.text = [NSString stringWithFormat:@"$%.2d", tweetDetail.];
    
    
    self.retweetCounter.text = [NSString stringWithFormat:@"%.1d", self.tweet.retweetCount];
    
    self.favoriteCounter.text = [NSString stringWithFormat:@"%.1d", self.tweet.favoriteCount];
    
    self.shareTweetCounter.text = @""; // I will need to edit this one later.
    
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    //NSData *urlData = [NSData dataWithContentsOfURL:url];
    
    //cell.profileImageLabel.image = tweetDetail.user.profilePicture;
    
    [self.profileImageLabel setImageWithURL:url];
    
    

    
    
}



- (IBAction)didTapFavorite:(id)sender {
    
    

    
    
    if(self.tweet.favorited){
        NSLog(@"UNDO");
    


    
    //API Function
        
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
                
                
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet);

                [self refreshData];
                self.tweet.favorited = NO;
                self.tweet.favoriteCount -=1;
                
                
               }
            
            
        }];
}
else{
    NSLog(@"LOVE");
    //Favorite the tweet

    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
             NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", tweet);
            //[self.likeButton setImage:[UIImage imageNamed: @"favor-icon-red"] forState:UIControlStateNormal];
            [self refreshData];
            self.tweet.favorited = YES;
            self.tweet.favoriteCount += 1;
            
            
           }
        
        
    }];
    
    



                }
    
    
    





    
    
 
    
    
    

    
    

    
    
    
    NSLog(@"TAPPED");
    
 
}



- (IBAction)retweetButtonAction:(id)sender {
    
}

@end
