#  Review notes

## Here's my trail of thought so you know how this solution came about
1. I tried running the Google Drive sample from the official repo and realized it's only Obj-C and only for MacOS X. I was able to test the API with MacOS project credentials that I created in their console. Ok, so it must work somehow.

2. I tried to integrate the official SDK using SPM, but couldn't import it for some reason.

3. I found this repo: https://github.com/lucka-me/potori-swift/tree/7fdcb4efaafcd487c6a92db99d34132d7027bbbc that uses Google REST API in a Swift project too. Tried to make it to run and replicate - again, failing to import. They are using a fixed SPM fork: https://github.com/woxtu/google-api-objectivec-client-for-rest

4. Since the SPM couldn't find and expose the Google Drive modules for importing, I thought of a different route - embedding the framework and then exposing it manually into Swift through a simplified API imported to bridging header

5. Next, I've got a message from Grant saying that creating a mock API resource would suffice, so I proceeded with that.

6. See more commentary in the code. I kept some of the Google API integration code there as it might be used later on when the project continues (that would be the real-world scenario). I didn't keep the SPM definition nor any code that wasn't tested and working. But you can find it in the initial commit, if interested. But not much to see there really. I kept the Bridging header as well, in case we needed to use it in the future.

7. I used the auth code from one of the Google's samples for G-Auth with a bit of refactoring to suit the new codebase. I could hide the fact that I was inspired by them, but I chose to leave the license headers and everything in place so you can see which parts are completely written from scratch and where it was heavily modified and to which extend.
