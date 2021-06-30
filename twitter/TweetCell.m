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

@implementation TweetCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTapFavorite:(id)sender {
  
//    self.tweet.favorited = YES;
//    self.tweet.favoriteCount += 1;
//

 
 
//    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
//        if(error){
//             NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
//        }
//        else{
//            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
//        }
//        
//        
//    }];
    
    NSLog(@"TAPPED");
    
    
//
//    self.Tweet = YES;
//    self.tweetDetail.favoriteCount += 1;
    
}



- (IBAction)retweetButtonAction:(id)sender {
    
}

@end
