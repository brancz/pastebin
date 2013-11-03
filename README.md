# Pastebin

You can deploy this pastebin to to heroku in a few simple steps.

## Create the config file and push to Heroku

Go to the root directory of the repository.

Then create the repository on heroku and add postgres and mandril for
sending registration emails.

	heroku create
	heroku addons:add heroku-postgresql:dev

If you want to send confirmation/unlock/forgotten password emails you are
going to need a service like Mandrill. Note: your heroku account needs to
be varified for Mandrill. To add Mandrill to your Heroku app use this
command.

	heroku addons:add mandrill:starter	

Then use this command to create the sample configuration file. 

	cp config/vim_pastebin.yml.example config/vim_pastebin.yml

Then edit the config to match your needs. Change host, add github oauth
settings and add mandrill smtp if you chose to use it.

	vim config/vim_pastebin.yml

Once you are done with that, you can add the config file to git and push
it.

	git add -f -A
	git commit -m "Heroku Deploy"
	git push heroku master

Then you have to initialize the database.

	heroku run rake db:migrate
