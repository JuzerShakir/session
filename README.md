# Project: Session & Cookie
*This Rails application shows how a session is used with cookies from a client's browser.*

<div align="center">
  <img src="project_logo.png" />
</div>

> *Description*

----

## ❗ Objectives
This web-app must accomplish the following:
- [x] Use PostgreSQL database which stores email and password of a visitor...
- [x] Only valid email formats is allowed and it should be unique.
- [x] Use BCrypt gem to store secure hash password and it should be atleast 6 to 36 characters long.
- [x] Show validation error messages to visitors if any.
- [x] Create Session using CookieStore as soon as visitors sign up.
- [x] Show different homepage content for signed in and non-signed in visitors.
- [x] If visitor logs in with an email that doesn't exist in database then redirect them to signup page.
- [x] If visitor signs up with an email that exist in our database then redirect them to sign in page.
- [x] Show appropraite flash messages whereever necessory like, new sign up, sign in, logout, etc.
- [x] Show visitor sign up count to both logged out and logged in visitors.
- [x] Redirect logged in visitor to homepage if he tries to visit log in or signup page.
- [x] Build a responsive site using bootstrap.
- [x] Show logged in visitors ways of destroying session.

----

## 💎 Required Gems

**This project was built on Ruby version *x*.**

Following gems were installed in these versions to execute the functionality:

|  **Gem Names**  |         **Gem**         | **Version** |                      **Use**                     |
| :------------:  |     :------------:      | :---------: |                    :---------:                   |
|      Rails      |        _'rails'_        |  **_____**  |    *Use for executing and rendering web-app*     |
|   Postgresql    |          _'pg'_         |  **_____**  | *Use postgres as the database for Active Record* |
|     SQLite      |        _'sqlite3'_      |  **_____**  | *Use sqlite3 as the database for Active Record*  |
|    Bootstrap    |      _'bootstrap'_      |  **_____**  |                *For CSS Styling*                 |
|     Devise      |       _'devise'_        |  **_____**  |             *For User Authentication*            |
|  Jquery Rails   |     _'jquery-rails'_    |  **_____**  |     *Bootstrap JavaScript depends on jQuery*     |
|   Font Awesome  | '_font-awesome-rails'_  |  **_____**  |             *Use Font Awesome icon sets*         |
|     Kaminari    |       _'kaminari'_      |  **_____**  |             *Use in pagination of posts*         |
|     Rake        |         _'rake'_        | **< 11.0**  |      *Use for common administration tasks*       |
|    BCrypt       |        _'bcrypt'_       |  **3.1.16** | *Secure hash algorithm for safely storing passwords* |
|     Faker       |        _'faker'_        |  **1.1.2**  |               *Generates dummy users*            |
| Will Paginate   |    _'will_paginate'_    |  **3.0.4**  |             *Use in pagination of users*         |
|       ""        | _'bootstrap-will_paginate'_ |  **0.0.9**  |                         ""                       |
|  RSpec Rails    |        _'rspec-rails'_      | **2.13.1**  |                 *Use for testing*                |
|   SASS Rails    |        _'sass-rails'_       |  **4.0.3**  |             *Use SCSS for stylesheets*           |


----

## 📋 Execution

Run the following commands to execute locally:

The following will install required version of ruby (make sure [rvm is installed](https://rvm.io/rvm/install).)
```bash
rvm install x
```
```bash
rvm use x
```
```bash
git clone git@github.com:JuzerShakir/project_name.git
```
```bash
cd project_name
```
```bash
bundle install
```
```bash
rails db:setup
```
```bash
rails s
```

To see this web-app up and running without executing above commands locally,
I have deployed it on [Heroku](https://__name__.herokuapp.com/).

Here's a short video where I go through the website:

[![Video Thumbnail](assets/yt-thumbnail.png)](https://www.youtube.com/watch?v=VIDEO_ID "Project Name")

-----

![](https://visitor-badge-reloaded.herokuapp.com/badge?page_id=juzershakir.repo_name&color=000000&lcolor=000000&style=for-the-badge&logo=Github)

<a href="https://wakatime.com/badge/github/JuzerShakir/repo_name"><img src="https://wakatime.com/badge/github/JuzerShakir/repo_name.svg" alt="wakatime"></a>
