# charsys
character system for dead city productions, new and improved

# setup

1. Do you have RVM? If you don't, go to http://rvm.io and get rvm, and then do rvm install 2.0 if you don't have ruby 2 installed.
2. you'll need to install [postgresql](http://postgresapp.com/) to run the app locally.
3. run rake db:create and then rake db:migrate
4. run thin start
5. go to localhost:3000
6. magic!

# notes

The attribute model is called "attribs" because rails already reserves the keyword "attributes", just roll with it

# other useful stuff

You may want to use something like [Postico](https://eggerapps.at/postico/) to browse the Postgres database; basically just leave all the default settings and the database name is "charsys", very easy. (There is a "buy" link but the only limitation on the free beta is the number of databases you can have open at once, I think.)

We're using [Bootstrap](http://getbootstrap.com/) for the general layout scaffolding and initial styles; we can override these later but it has some useful tools for laying out a site so I'd recommend skimming the CSS and Components pages to see what it's got