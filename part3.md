## Part 3 - Many-to-Many Associations

- create hashtags for your app
  - after a user has created a photo they can associate hashtags with that photo
  - a photo has many tags and a tag has many photos
  - on the page for a single photo create a form that creates a hashtag for that photo
  - the form should simply be a dropdown list of all possible hashtags

Hint: You won't need a model for this relationship. Only a Tag model and a Post model, and a join table between them. This join table should be called `posts_tags`.

#### further
Create a page for the hashtags that, when you click on each tag, shows a list of each photo associated with that tag.

#### further
If you don't already have it, alter your app to have a photo caption. In the controller, write the logic that *automatically* adds hashtags to the photo from the photo caption.


#### further
Use some browser side javascript to prompt the user if they want to record their current location as being associated with the post. If they do, ask them to tag this location. Implement these location tags as a separate table of location tags the above many-to-many features. (posts have many locations, locations have many posts) (this also means you will be storing at least 3 items of data in the location tags table- location latitude, location longitude and location name)

#### further
When the user wants to create a post, (before they have clicked on a 'new post' button) get their location and send it in the request for the form. When you are rendering the form, only show the tag checkboxes that are nearby the user.
