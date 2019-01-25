# WDInstagram

In this repository, there is a brand new rails application. It has no code in it except for the things that are generated with `rails new`.

![https://media.giphy.com/media/iccmKvtzsmEc8/giphy.gif](https://media.giphy.com/media/iccmKvtzsmEc8/giphy.gif)

## Prompt
Today you're going to make your own version of Instagram (or something very close to it!). Your photo feed app will have full CRUD capability and operate on a single *Post* model.

A **Post** has the following:

* `author_name`
* `photo_url`

Your app should have the following RESTful actions:

* index (displays all entries)
* show (displays a specific post)
* new (displays a form to create a new post)
* create (saves a new post it to the database)
* edit (displays a form for editing a particular post)
* update (takes input from the edit form and updates the post in the db appropriately)
* destroy (deletes a specific post from the database)


#### Further

Add a column for `caption` to your post, which is a text description of the shot. You'll need to generate a database migration for this and then update the rest of your app to be able to display these captions.

#### Further
Instead of using a string for a date, use rails timestamp.

#### Further
Sort your feed by date, ascending or descending, depending on what the user wants. (this will have to be a request parameter that you lok for, and sort according to it's value) - e.g. (?sort=date&order=dec)

#### Furtherer
1. Create the ability to make a new post using a random GIF from the [Giphy API](https://api.giphy.com/)
2. Try using the official giphy API gem: https://github.com/Giphy/giphy-ruby-client
