//
//  TweetCell.m
//  twitter
//
//  Created by abenezermolla on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

#import "Tweet.h"

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
    
    NSLog(@"TAPPED");
    
    
//
//    self.Tweet = YES;
//    self.tweetDetail.favoriteCount += 1;
    
}



- (IBAction)retweetButtonAction:(id)sender {
    
}

@end
