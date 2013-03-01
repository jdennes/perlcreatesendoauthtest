# perlcreatesendoauthtest

A very basic example application to demonstrate authenticating with the [Campaign Monitor API](http://www.campaignmonitor.com/api/) using OAuth.

This app uses the [Net::CampaignMonitor](https://github.com/campaignmonitor/createsend-perl) module to authenticate with the Campaign Monitor API, and is implemented using [Mojolicious](http://mojolicio.us/) (but could easily be adapted for use with any Perl web application framework).

You'll find most of what you need in [app.pl](app.pl). Has been deployed and tested on Heroku, using the [Perloku buildpack](https://github.com/judofyr/perloku).

You'll want to set the following environment variables before you deploy:

```
CREATESEND_CLIENT_ID # The client id for your app
CREATESEND_CLIENT_SECRET # The client secret for your app
CREATESEND_REDIRECT_URI # The redirect uri for your app
```

To deploy to Heroku:

- Clone the repo:
    ```
    $ git clone git@github.com:jdennes/perlcreatesendoauthtest.git
    $ cd perlcreatesendoauthtest/
    ```

- Create your Heroku app

    ```
    $ heroku create myperlapp -s cedar --buildpack http://github.com/judofyr/perloku.git
    ```

- Set your config values:

    ```
    $ heroku config:add CREATESEND_CLIENT_ID={client id} CREATESEND_CLIENT_SECRET={client secret} CREATESEND_REDIRECT_URI={redirect uri}
    ```

- Deploy:

    ```
    $ git push heroku master
    ```
