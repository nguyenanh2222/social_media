# social_media
SOCIAL_MEDIA API 

## Features
* New feed system
* Post photo/image/video posts
    * Like posts
    * Comment on posts
        * View all comments on a post
* Search for users
* Realtime Messaging and Sending images
* Deleting Posts
* Profile Pages
    * Change profile picture
    * Change username
    * Follow / Unfollow Users
    * Add your own bio
* Notifications Feed showing recent likes / comments of your posts + new followers

## Rule working in git
* commit messs: [issu] #number of insuss [isuss name]

    * [setup] #1 python 3.10
    * [setup] #2 docker connect db postgresql

## Requirement
    Use Django, DjangoRestFramework
    Implement JWT authentication plugin
    Has 1 middleware to log to a file: total time to process a request/response
    Connect to 2 database (postgresql/mariadb/mysql) run in replication mode (1 master, 1 slave)
        create a db-router to write only to master database
                              read only from slave database
    Deploy with Gunicorn (3 concurrent workers)
 
## Run
command terminal: python3 manage.py runserver




