Hakuna
======

Need Grunt Build script for Sass and Coffeescript. Compress and Minifies results to make static front-ends production ready.

It's our problem free, philosophy!

Things needed before running hakuna

### Pre-requistes ###
* node
* npm
* ruby (need for sass)
* sass
* grunt command line

## Install Sass ##

    gem install sass

## Install Grunt Command Line ##

    npm install grunt-cli 


## Install NPM Packages ##
    
    npm install 

## Available commands
    
    grunt

This sets up a development enviroment which builds an uncompressed but concatenated script and stylesheets. To make things easier it puts everything into a folder ./dev/ 

    grunt build

When everything is ready to ship run this and use the minified stylesheets. It builts a dev version and concatenates, minifies and compress everything down.