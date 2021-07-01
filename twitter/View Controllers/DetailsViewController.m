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

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePictureView;
@property (weak, nonatomic) IBOutlet UILabel *profileNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileUsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileTweetText;
@property (weak, nonatomic) IBOutlet UIButton *likeButtonDetail;
@property (weak, nonatomic) IBOutlet UIButton *retweetButtonDetail;
@property (weak, nonatomic) IBOutlet UILabel *profileDateLabel;

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
