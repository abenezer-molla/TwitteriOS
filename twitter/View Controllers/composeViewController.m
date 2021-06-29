//
//  composeViewController.m
//  twitter
//
//  Created by abenezermolla on 6/29/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "composeViewController.h"

#import "APIManager.h"

#import "Tweet.h"



@interface composeViewController ()

@end

@implementation composeViewController

- (IBAction)tweetAction:(id)sender {
    [[APIManager shared]postStatusWithText:self.tweetText.text completion:^(Tweet *, NSError *) {
        if (self) {
            NSLog(@"Successfully posted a tweet!");
        } else {
            NSLog(@"Failed while posting a tweet!");
        }
    }];
    [self dismissViewControllerAnimated:true completion:nil];
    
    
}


- (IBAction)closeAction:(id)sender {
    
    [self dismissViewControllerAnimated:true completion:nil];

    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tweetText.delegate = self;
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
