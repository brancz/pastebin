# Pastbin

You can deploy this pastebin to to heroku in a few simple steps.

## Create the config file

Go to the root directory of the repository.

Then create the repository on heroku and add postgres and mandril for
sending registration emails.

	heroku create
	heroku addons:add mandrill:starter	
	heroku addons:add heroku-postgresql:dev

Then use this command to create the sample configuration file. Then fill 
in the config file you copied and fill in the information of the heroku
services. 

	cp config/vim_pastbin.yml.example config/vim_pastebin.yml

Once you are done with that, you can add the config file to git and push
it.

	git add -f -a
	git push heroku master
