# Foghub

Foghub associates Git commits with Fogbugz cases and code reviews.

Foghub is known to run on MRI Ruby 1.9.2.

The code is under development.

# Why do code reviews?

[Simply read this blogpost](http://www.codinghorror.com/blog/2006/01/code-reviews-just-do-it.html).

# Setup

Foghub is a Sinatra application that can receive, and parse, the data given by Github's service hooks.

Clone this repository, and edit `config.yml` to include your Fogbugz credentials.

Commit your configuration file and deploy Foghub on e.g. Heroku. 

Set your Github repository's post-recieve URL service hook to:

    <domain>/commit/<token>

Where `<token>` is the token specified in `config.yml`.

Each time a commit hits your Github repo, Foghub should take care of getting your commits into Fogbugz:

![Diagram](http://i.imgur.com/10TKS.png)

# Feature plans

Associate commit with case: 

    git commit -am "This is a commit #65"

This will post a comment to case 65 on Fogbugz with the commit message that references the Git commit on Github.

Request Fogbugz code review:

    git commit -am "This is a commit that needs review #review @user"

Creates a new code review in Fogbugz and assigns it to `@user`. If you do not specify a reviewer, Foghub will simply create an unassigned code review.

Request code review and associate with case:

    git commit -am "This commit to case #65 needs #review by @user"

Will create a new code review in Fogbugz and assign it to the user specified in the commit message. Additionally, the commit message will be attached to case 65 in Fogbugz.

Commits can be associated with multiple Fogbugz cases:

    git commit -am "This commit is closing case #65 and #66"

Creates a Fogbugz comment with the commit message in case 65 and 66 linking to the commit on Github.

# Copyright

Copyright (c) 2011 Firmafon ApS. This project is licensed under the MIT license, see LICENSE for details.
