futurestop-ios
==============

###Getting Started
__Git Repo_
* Ask for a new repo for your project
* Duplicate this repo into your project's repo https://help.github.com/articles/duplicating-a-repository 

__Code Signing_
* Make sure Xcode is open
* In your repo's root directory find and open the 'Provisioning' folder
* Drag 'FutureStopiOSDistro.developerprofile' into Xcode
* Type the password we gave you

__Building Archive__
* Find out what number is assigned to your iOS Future Stop project
* Update the FutureStop target's bundle identifier with your project number, for example if you are working on project number 3 update the identifier from com.mmsxswcreatathon.FutureStop to com.mmsxswcreatathon.3.FutureStop
* Update the FutureStop target's code signing build settings, leave the DEBUG pointing to the wildcard dev profile but change the RELEASE to point to the ad hoc profile bound to your bundle identifier from the previous step
* Select the FutureStop scheme and set the destination to 'iOS Device' and select 'Archive' from the 'Product' menu in the top menu bar
* If your build is successfull you are ready to go!

###Deploying to TestFlight
You will need to deploy your app to test flight if you want to push app updates wirelessly to the bus stop iOS devices. You can also use test flight to deploy to your own devices.
* Make sure you have a TestFlight account and that you have been added to the team
* Make sure the device you are deploying to is registered in TestFlight and has been added to the Ad-Hoc provisioning profile, if you are not sure look for Rene
* Make sure to download the TestFlight desktop app: https://testflightapp.com/desktop/
* Archive the app with the steps in 'Getting Started'
* In the organizer, under the Archive tab, select the archive you just built, and click the 'Distribute' button
* Select 'Save for Enterprise or Ad-Hoc Deployment'
* Select the 'Rene Cacheaux (iOS Distribution)' profile under your project's bundle identifier
* Click Next and save the .ipa to your local disk
* Open the TestFlight desktop app
* Find your .ipa in Finder and drag into the TestFlight desktop app
* Follow the instructions and you should be good to go

###Key Points
* This project's dependencies are managed by CocoaPods, open the Workspace file not the Project File
* The project comes pre-packaged with many third party libraries, look at the Podfile file to see what is included
