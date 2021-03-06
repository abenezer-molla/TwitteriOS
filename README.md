# Twitter

### Starter project
The starter project can be found in the `starter-project` tag. Download and run `pod install`.


### Notes
https://paper.dropbox.com/doc/Twitter--ADuVCVvwop_njSNAbUU96Q2VAQ-g255BPX3K4X7G0reYOWCI



# Project 3 - *TwitterApp*

**Aben's Twitter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **18** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User sees app icon in home screen and styled launch screen
- [x] User can sign in using OAuth login flow
- [x] User can Logout
- [x] User can view last 20 tweets from their home timeline
- [x] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [x] User can pull to refresh.
- [x] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [x] User can compose a new tweet by tapping on a compose button.
- [x] Using AutoLayout, the Tweet cell should adjust its layout for iPhone 11, Pro and SE device sizes as well as accommodate device rotation.
- [x] User should display the relative timestamp for each tweet "8m", "7h"
- [x] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet and favorite.

The following **optional** features are implemented:

- [ ] User can view their profile in a *profile tab*
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
  - [ ] Profile view should include that user's timeline
- [x] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. Refer to [[this guide|unretweeting]] for help on implementing unretweeting.
- [ ] Links in tweets are clickable.
- [ ] User can tap the profile image in any tweet to see another user's profile
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [ ] When composing, you should have a countdown for the number of characters remaining for the tweet (out of 280) (**1 point**)
- [ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet (**2 points**)
- [ ] User sees embedded images in tweet if available
- [ ] User can switch between timeline, mentions, or profile view through a tab bar (**3 points**)
- [ ] Profile Page: pulling down the profile page should blur and resize the header image. (**4 points**)


The following **additional** features are implemented:

- [x] List anything else that you can get done to improve the app functionality!

I made sure that the time stamp updates both when we refresh and when the like and retweet buttons are pressed. That will made it easy to see the time of one specific tweet without having to refresh the whole tableView. 

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. protocols
2. models

## Video Walkthrough

Here's a walkthrough of implemented user stories:




https://user-images.githubusercontent.com/57775399/124213720-e9afbe80-daa5-11eb-8e56-d079c8583491.mov



https://user-images.githubusercontent.com/57775399/124213749-f59b8080-daa5-11eb-9b9f-75d9f9b37e5a.mov







https://user-images.githubusercontent.com/57775399/124213764-fd5b2500-daa5-11eb-8cd8-85269a5123e4.mov







https://user-images.githubusercontent.com/57775399/124213792-064bf680-daa6-11eb-822d-54af425c1ab8.mov








![ezgif com-video-to-gif-4](https://user-images.githubusercontent.com/57775399/124214853-c423b480-daa7-11eb-8d91-2a82dcecc967.gif)





![ezgif com-video-to-gif-5](https://user-images.githubusercontent.com/57775399/124215181-63e14280-daa8-11eb-8fe9-bd6449cb08d3.gif)

GIF created with [Kap](https://getkap.co/).

## Notes

Describe any challenges encountered while building the app.

My Initial problem was with challenge was with protocols, deligates and models. I spent a while to have a good understanding to be able to debug my code. Also since the Twitter project have it's own APIManager, it was a bit confusing to go from my Flixer App understanding of structure to this one. But as I work through it, I found out how much it made my life easier. 

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
