//
//  TweetCell.h
//  twitter
//
//  Created by abenezermolla on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Tweet.h"

#import "APIManager.h"

NS_ASSUME_NONNULL_BEGIN




@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *tweetCellView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *shareTweetLabel;

@property (weak, nonatomic) IBOutlet UIImageView *messagePeopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *shareCounter;
@property (weak, nonatomic) IBOutlet UILabel *retweetCounter;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCounter;
@property (weak, nonatomic) IBOutlet UILabel *createdAt;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UILabel *shareTweetCounter;

@property (weak, nonatomic) IBOutlet UIButton *likeButton;

@property (weak, nonatomic) IBOutlet UIButton *retweetButton;


////////////


@end

NS_ASSUME_NONNULL_END
