## Part 2 - Many-to-One Relationships

- create comments for your app
  - a photo has many comments
  - a comment belongs to a photo

- change your `show` route for a single photo to include a form that creates a comment
- show a list of all comments on the page for a single photo

#### further
For the list of all comments for a specific photo, allow edit and delete for that comment.

#### further
For the list of all photos, display the count of comments for each photo in the list.

#### further
Use [ffaker](https://github.com/ffaker/ffaker) gem, specifically [images](https://github.com/ffaker/ffaker/blob/master/REFERENCE.md#ffakerimage) to create fake data for your app. This script should go in the seed.rb file of your app.

#### further
Use the [soundcloud gem](https://github.com/soundcloud/soundcloud-ruby) to automatically associate a random song or clip to a given photo when it is created.

With browser side JS, use the embeded soundcloud player to put the music on the page: https://developers.soundcloud.com/docs/api/html5-widget

In rails, each javascript file will be included on every page. To add a browser side javascript file, add it to: `app/assets/javascripts` (you don't need to do anything else)

#### further
Add the posting of songs to the app. Use the soundcloud API. Then allow the association of any song to any photo.
You'll change your app to add a new songs table. A song will have many photos. A photo will belong to a song.
