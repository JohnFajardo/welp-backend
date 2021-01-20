# 🗺️ Welcome to Welp 🗺️

This is a practice project that was born out of inspiration from Yelp. Users are able to click on locations on a map to see reviews left by other users; or they can leave a review if there's none. Users are able to like reviews left by other users and see/edit their own profiles.

![](welp.gif)

## How to run

- Clone this repo and `cd` into it:

```
git clone git@github.com:ThatJohn/welp-backend.git
cd welp-backend
```

- Install dependencies:

```
bundle install
```

- If you're in Linux, you might have to create the database manually, but your mileage may vary:

```
rails db:create
```

- Then migrate and seed the database:

```
rails db:migrate
rails db:seed
```

**You also need to provide a key for password and token encription. There are two ways of accomplishing that:**

- The first and preferred way is to edit your `.bashrc` or `.zshrc` file and add the following line at the end:

```
export jwt_secret='someRandomStringOfYourChoosing'
```

and then restaring your terminal for the change to take effect. The alternative is to just add the random key to the application. Open up ./app/controllers/application_controller.rb and change line 11 from:

```
ENV['jwt_secret']
```

to:

```
'someRandomStringOfYourChoosing'
```

Please note that this method is not advisable because it's bad practice and a security liability. However, it's fine if you don't plan to upload it anywhere or just want to do a quick code review.

- Now you're ready to run the app:

```
rails s
```

- And check that the app is running by visiting `http://localhost:3000`. If you get the standard rails greeting, you're good to go.

- Now head to the [frontend instructions](https://github.com/ThatJohn/welp-frontend).
