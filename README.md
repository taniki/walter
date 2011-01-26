Walter
======

**Walter** is a small web app written in ruby and [sinatra](http://sinatrarb.com). The unique purpose is to manage a directory full of quotes and the informations that get along.

It is also like very inspired by [toto](http://cloudhead.io/toto)'s architecture.

The name is of course a tribue to Walter Benjamin and his obsession for quotes.

Mini-start in 10 seconds
=========================

	$ sudo gem install walter
	$ git clone git://github.com/taniki/theodor.git webquotes
	$ cd webquotes
	$ thin start -R config.ru

(configuring [passenger](http://modrails.com) is 10 more seconds)

Features
========

- quotes are stored as text file
	- bibliographical info should be like bibtex specs and formated in yaml
	- body can be formated with markdown (rdiscount)
- templating is done with *erb*
- URL are not in german just because of guiltiness

TODO
====

- #### now
	- having fun
	- continue the CSS
	- multi-authors books
	- author view
	- display the year
	- put a proper permalink system
	- different levels of importance

- #### über-ich
	- check english typographic rules
	- make it easy for multilingual stuffs
	- clean the code

- #### far, far future
	- Search engine
	- Tags
	- Better bibtex rendering
	- Export formats