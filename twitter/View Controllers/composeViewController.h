//
//  composeViewController.h
//  twitter
//
//  Created by abenezermolla on 6/29/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN
//  ComposeViewController.h
@protocol ComposeViewControllerDelegate

- (void)didTweet:(Tweet *)tweet;

@property (nonatomic, weak) id <ComposeViewControllerDelegate> delegate;

@end

@interface composeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *tweetText;

@end

NS_ASSUME_NONNULL_END
