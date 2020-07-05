# Taylor SwiftUI

## Summary
Join me on a journey to learn Swift UI by creating an app to browse the discography of Taylor Swift.

Each branch in this repo shall move us closer to our goal of an amazing project, so far we are quite far from being there.

### 01- the basics.
In my first day on Taylor SwiftUI, I write my very first SwiftUI code, creating a simple list -> detail view that displays a list of albums which then takes us into a detail view of the album with a simple full screen image of art work.
A new view model struct called Album is created to contain our basic album info and a DataService is established and bound to our ListView to load the data.
All Data is hard coded.

### 02- Dynamic Data Load
Day Two- we load album data dynamically from the itunes api. We create a new data store to serve as the model and observe that model in our list view to propogate it through our views. 

### 03- Remote Image Loading
We replace our hardcoded images with album artwork loaded from the network returned from the itunes api.
This is done by utilizing a new RemoteImage view.

### 04 - UI Clean Up
Let's make this app look a bit better shall we? Today, we fix scaling issues on pixelated images, add thumbnails to the list view and add a link to the apple music url to listen to songs via a new SafariView. 
The app is starting to become functional!

### 05 - Song List
Add a song listing to the detail page of each album, loaded from the itunes search api.
The list screen gets a new section header and the UI is improved on the detail page.

## Author

Logan Sease, lsease@gmail.com

## License

Code is available under the MIT license. See the LICENSE file for more info.
