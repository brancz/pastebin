# Pastbin

You can deploy this pastebin to to heroku in a few simple steps.

## Create the config file

Go to the root directory of the repository.

Then use this command to create the sample configuration file.

	cp config/vim_pastbin.yml.example config/vim_pastebin.yml

Then create the repository on heroku and add postgre and mail

	heroku create
	heroku addons:add mandrill:starter	
	heroku addons:add heroku-postgresql:dev

Now fill in the config file you copied and fill in the information
of the heroku services.

Once you are done with that, you can add the config file to git and push
it.

	git add -f -a
	git push heroku master
