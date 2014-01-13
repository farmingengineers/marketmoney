# Market Money

We're going to try a new thing with our CSA this year.
Instead of getting a box with a fixed set of items, members
will buy something similar to a gift card. They'll get a
discount on our products.

This app tracks members' balances. We'll use it to keep
things up-to-date. Members can use it to check their
balances whenever they want.

## Run your own!

We made this open source so that you can use it, too. You'll
want to customize a couple of things.

### The look and the name

The default name of the application is "Market Money". The simplest
way to change it is by setting the environment variable `APP_TITLE`.

This app has our look & feel. The markup is fairly simple,
and it should be easy to customize. Modify `app/assets/stylesheets/custom.css`
with your changes.

### Authentication

... todo

### Session key

The default session key for production is "Set a secret key! (see readme)".
Use an environment variable to set the secret key. A good source of secret keys
is ruby's SecureRandom class.

e.g. on heroku, you could do this:

    $ heroku config SECRET_KEY_BASE=`ruby -rsecurerandom -e "puts SecureRandom.hex(64)"`
