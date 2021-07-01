//
//  DetailsViewController.m
//  twitter
//
//  Created by abenezermolla on 7/1/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"

#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePictureView;
@property (weak, nonatomic) IBOutlet UILabel *profileNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileUsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileTweetText;
@property (weak, nonatomic) IBOutlet UIButton *likeButtonDetail;
@property (weak, nonatomic) IBOutlet UIButton *retweetButtonDetail;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    
//    NSString *baseURLString = @"https://api.twitter.com/1.1/statuses/show.json";
//    
//    NSString *posterURLString = self.tweetDict[@"text"];
//    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
//    
//    //NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
//    
//   // [self.profilePictureView setImageWithURL:posterURL];
//    
//   
//    
//    NSString *backdropURLString = self.tweetDict[@"text"];
//    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
//    
//    NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
    

//    
//    self.profileNameLabel.text = self.tweetDict[@"text"];
//    
//    self.profileUsernameLabel = self.tweetDict[@"text"];
//    
//    self.profileTweetText = self.tweetDict[@"text"];
//    
//    [self.profileNameLabel sizeToFit];
//    [self.profileTweetText sizeToFit];
    // Do any additional setup after loading the view.
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
