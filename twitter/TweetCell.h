//
//  TweetCell.h
//  twitter
//
//  Created by abenezermolla on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *tweetCellView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *shareTweetLabel;
@property (weak, nonatomic) IBOutlet UIImageView *retweetLabel;
@property (weak, nonatomic) IBOutlet UIImageView *likeTweetLabel;
@property (weak, nonatomic) IBOutlet UIImageView *messagePeopleLabel;

@end

NS_ASSUME_NONNULL_END
