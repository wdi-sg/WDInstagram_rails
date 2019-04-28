# WDInstagram

In this repository, there is a brand new rails application. It has no code in it except for the things that are generated with `rails new`.

![https://media.giphy.com/media/iccmKvtzsmEc8/giphy.gif](https://media.giphy.com/media/iccmKvtzsmEc8/giphy.gif)

## Prompt
Today you're going to make your own version of Instagram (or something very close to it!). Your photo feed app will have full CRUD capability and operate on a single *Post* model.

A **Post** has the following:

* `author_name`
* `photo_url`
* `title`


Your app should have the following RESTful actions:

* index (displays all entries)
* show (displays a specific post)
* new (displays a form to create a new post)
* create (saves a new post it to the database)
* edit (displays a form for editing a particular post)
* update (takes input from the edit form and updates the post in the db appropriately)
* destroy (deletes a specific post from the database)


#### Further ✅

Add a column for `caption` to your post, which is a text description of the shot. You'll need to generate a database migration for this and then update the rest of your app to be able to display these captions.

#### Further ✅
Add a rails timestamp to your table.

#### Further 
Sort your feed by date, ascending or descending, depending on what the user wants. (this will have to be a request parameter that you lok for, and sort according to it's value) - e.g. (?sort=date&order=dec)

#### Further
1. Create the ability to make a new post using a random GIF from the [Giphy API](https://api.giphy.com/)
2. Try using the official giphy API gem: https://github.com/Giphy/giphy-ruby-client

#### Further
Add a second kind of post - a you tube video.

The thing you store in the DB will be an embedded youtube link. [https://www.w3schools.com/html/html_youtube.asp](https://www.w3schools.com/html/html_youtube.asp), [https://gorails.com/forum/embed-youtube-video-in-rails-app](https://gorails.com/forum/embed-youtube-video-in-rails-app)

Create the CRUD routes for this kind of post.

#### Further
Add all of the videos to the root route index page. 

#### Further
Intermix them with the photos, sorted by date.

#### Further
Add a third kind of post - a text only post. (`text`)

#### Further
Intermix them with the photos, sorted by date.

#### Further
Alter the show routes for each post type. (`/post/:id`, `/video/:id`, `/text/:id`)
Using the ruby twitter [gem](https://github.com/sferik/twitter) to get a list of tweets for each post that are associated with the title.

(use the API to do a search and display the resulting tweets of that search)