# MovieBrowser

## Requirements
* Apple silicon
* Xcode 16.2
* At least iOS 17

## Dependencies
* [Apollo](https://github.com/apollographql/apollo-ios.git): GraphQL networking library
* IMDbAPI: Local dependency generated using the steps described below.

## Compile and Run the project
* Open project with Xcode
* If local dependency "IMDbAPI" is present, remove it from Package Dependencies
* Get package dependencies
* Go to File->Packages from the menu bar and select "Install CLI". If the option is not present it means the Apollo package is not installed
* Accept the pop-ups
* Open terminal, change directory to the project folder and run "./apollo-io-cli generate"
* Go to Package Dependencies setting in Xcode and add local package "IMDbAPI" from project folder
* Run the project

## Design notes
* Figma source: https://www.figma.com/design/cLub3jrsAqCdQzURbFvcsc/Movie-Mobile-App-UI-Design-(Community)?node-id=3-3&t=CKzh5eevW2yDcvd3-0

## Design trade-offs
* The app is not pixel-perfect because on Figma I found two screenshots instead of an actual screen design. 
* The project uses system images and colors as close as possible to the ones from screen since they are not available in Figma developer mode
* Each element size is also an approximation, being unable to get the exact size due to the mentioned limitations

## Other trade-offs
* Strings are used as-is through the app, they must be extracted in a localizable file or organized somehow
* App architecture can be refined more and changed depending on the project size

## Challenges
* Creating the UI using only screenshots as reference
* Integrating GraphQL: on internet the information is limited and mostly outdated. Also because it's the first time using GraphQL I had to spend some time on research.

