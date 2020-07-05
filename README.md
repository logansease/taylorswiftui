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
https://github.com/logansease/taylorswiftui/pull/1

### 03- Remote Image Loading
We replace our hardcoded images with album artwork loaded from the network returned from the itunes api.
This is done by utilizing a new RemoteImage view.
https://github.com/logansease/taylorswiftui/pull/2

### 04 - UI Clean Up
Let's make this app look a bit better shall we? Today, we fix scaling issues on pixelated images, add thumbnails to the list view and add a link to the apple music url to listen to songs via a new SafariView. 
The app is starting to become functional!
https://github.com/logansease/taylorswiftui/pull/3

### 05 - Song List
Add a song listing to the detail page of each album, loaded from the itunes search api.
The list screen gets a new section header and the UI is improved on the detail page.
https://github.com/logansease/taylorswiftui/pull/5


![Simulator Screen Shot - iPhone 11 - 2020-07-05 at 12 30 53](https://user-images.githubusercontent.com/1085547/86537332-66708280-bebc-11ea-876e-0cdda2a5c92a.png)
![Simulator Screen Shot - iPhone 11 - 2020-07-05 at 12 30 58](https://user-images.githubusercontent.com/1085547/86537335-68d2dc80-bebc-11ea-9dc6-668904e6871f.png)




## Author

Logan Sease, lsease@gmail.com

## License

Code is available under the MIT license. See the LICENSE file for more info.
