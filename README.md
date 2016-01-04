**README**

This app implements (most of) Student logic, i.e. Users APIs from Pearson Learning Studio.
However, most of the implementation is not complete; most of features are for demonstration purposes without actual data behind.

***Preq-requisites***
* Ruby 2.0.0 (or any version above should work as well)
* Crypto++, 5.2.0 (mostly available on Mac OS X and Ubuntu 13.04)
* Rails 4.2.5 (or any version 4.2.x should work fine)
* Mac OS X (Ubuntu Linux should work fine as well)
* PostgreSQL 9.4.5 (versions 9.4.x should work too)
* Your own set of API keys from Pearson Learning Studio (set as environmental variables)

***Installation steps***

Given you've installed all preq-requisites above and they function (its highly recommended to have PostgreSQL server up and running), follow the steps:
```
$ cd path/to/progress_tracker
$ bundle install
$ cd lib/learning_studio_authentication/ext/learning_studio_authentication && bundle exec ruby extconf.rb && make
$ cd back/to/your/path/of/progress_tracker
$ cd lib/learning_studio_authentication && rake install // will probably give error, ignore it
$ psql -c 'create database progress_tracker_test;' -U postgres
$ rake db:migrate
$ rake db:seed
```

If everything will go well (i.e. no errors except the one from ```rake install```), run the project:
```
$ rails s
```

Using browser of your choice (I would strongly advice to use Chrome / Firefox / Safari as main options), navigate to
[http://localhost:3000](http://localhost:3000) to find the Progress Tracker up and running.

Enjoy!

***Issues / Bugs***

If you experience any errors during/after installation/launch, please file an issue for this project or make a pull request if you know what is wrong and how to fix it.
Thank you!
