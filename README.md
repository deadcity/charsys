# charsys
character system for [dead city productions](http://deadcityproductions.com/), new and improved

currently deployed: [version 1.0](http://characters.deadcityproductions.com/)

# bugs? comments? concerns?

Contact any member of the dev team:
  - [Carly Ho](https://github.com/cmho) - yaysunshine@gmail.com
  - [Stephanie Marx](https://github.com/stephmarx) - stephanie.n.marx@gmail.com
  - [Korey Enright](https://github.com/korey-enright) - kenright19@gmail.com

Additionally, this project is open source. We welcome contributions and enhancement suggestions.

# setup

1. Do you have RVM? If you do not have RVM go to rvm.io and install the thing and then install Ruby 2. ("rvm install ruby 2.0")
2. change directory into the application and bundle install!
3. you'll need to install [postgresql](http://postgresapp.com/) or platform equivalent to run the app locally.
4. run rake db:create and then rake db:migrate
5. run thin start
6. go to localhost:3000
7. magic!

# notes

The attribute model is called "attribs" because rails already reserves the keyword "attributes", just roll with it

# other useful stuff

You may want to use something like [Postico](https://eggerapps.at/postico/) to browse the Postgres database; basically just leave all the default settings and the database name is "charsys", very easy. (There is a "buy" link but the only limitation on the free beta is the number of databases you can have open at once, I think.)

Also: acquire the [Heroku Toolbelt](http://toolbelt.heroku.com/) and make a Heroku account so I can give you the ability to push code to the production environment (also tell me (carly) when you have done that)
