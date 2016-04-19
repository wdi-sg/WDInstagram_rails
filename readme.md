# WDInstagram

In this repository, there is a brand new rails application. It has no code in it except for the things that are generated with `rails new`.

## Prompt
Today you're going to make your own version of Instagram (or something very close to it!). Your photo feed app will have full CRUD capability and operate on a single Entry model.

An Entry has the following:

* `author`
* `photo_url`
* `date_taken`

Your app should have the following RESTful actions:

* index (displays all entries)
* show (displays a specific entry)
* new (displays a form to create a new entry)
* create (saves a new entry it to the database)
* edit (displays a form for editing a particular entry)
* update (takes input from the edit form and updates the entry in the db appropriately)
* destroy (deletes a specific entry from the database)

### Instructions

1. Write 5 user stories for your app.
  * Keep it simple and think about what functionality your MVP needs.
2. Write the app. (If you need more instructions, reference [tunr](https://github.com/ga-wdi-exercises/tunr_rails_features) or lesson plans on rails )

### Bonus

1. Add a column for `caption` to your Entry, which is a text description of the shot. You'll need to generate a database migration for this and then update the rest of your app to be able to display these captions.
2. Add a second "Comments" model to your app so that users may leave comments on each of your Entries.
3. Give your Comments model full CRUD capability.

### Super bonus
1. Create the ability to make a new entry using a random GIF from the [Giphy API](https://api.giphy.com/)
