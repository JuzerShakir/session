# Project: Creating Session in Browser

_A Rails webapp that uses cookies to maintain a session with clients' browsers._

<div align="center">
  <img src="project_logo.png" />
</div>

![](https://visitor-badge-reloaded.herokuapp.com/badge?page_id=juzershakir.rails-session&color=000000&lcolor=000000&style=for-the-badge&logo=Github)

<a href="https://wakatime.com/@JuzerShakir/projects/kwaqldewfx?start=2021-11-02"><img src="https://wakatime.com/badge/user/ccef187f-4308-4666-920d-d0a9a07d713a/project/2ea4fb3b-6100-4a22-a419-68afbb0e1761.svg" alt="wakatime"></a>

---

## ❗ Objectives

This web-app must accomplish the following:

- [x] Use the PostgreSQL database which stores the email and password of visitors.
- [x] Only valid email formats are allowed and it should be unique.
- [x] Use the BCrypt gem to store a secure hash password and it should be at least 6 to 36 characters long.
- [x] Show validation error messages (if any) to signing in visitors.
- [x] Create a session using CookieStore as soon as visitors sign up.
- [x] Show different homepage content for signed-in and non-signed-in visitors.
- [x] If a visitor logs in with an email that doesn't exist in the database, redirect them to the signup page.
- [x] If a visitor signs up with an email that exists in our database then redirect them to the sign-in page.
- [x] Show appropriate flash messages wherever necessary like new sign up, sign in, logout, etc.
- [x] Show visitor sign-up count for both logged out and logged in visitors.
- [x] Redirect logged-in visitor to the homepage if he tries to visit the log-in or signup page.
- [x] Build a responsive site using bootstrap.
- [x] Show logged-in visitors different ways of destroying the session.
- [x] When a visitor manually enters a URL that doesn't exist, redirect them to the homepage with a flash message informing them that the URL doesn't exist.

---

## 💎 Required Gems

**This project was built on Ruby version _2.7.2_.**

Following important gems were installed in these versions:

| **Gem Names** |      **Gem**       | **Version** |                       **Use**                        |
| :-----------: | :----------------: | :---------: | :--------------------------------------------------: |
|     Rails     |     _'rails'_      | **6.1.4.1** |      _Use for executing and rendering web-app_       |
|  Postgresql   |       _'pg'_       |  **1.2.3**  |   _Use postgres as the database for Active Record_   |
|   Bootstrap   | _'bootstrap-sass'_ |  **3.4.1**  |                  _For SCSS Styling_                  |
|    BCrypt     |     _'bcrypt'_     | **3.1.16**  | _Secure hash algorithm for safely storing passwords_ |

---

## ⚙️ Setting up a PostgreSQL user

If you don't have a user set on postgres, here's how to set new user:

```bash
sudo -u postgres createuser -s [username]
```

To set a password for this user, log in to the PostgreSQL command line client:

```bash
sudo -u postgres psql
```

Enter the following command to set the password:

```bash
\password your_password
```

Enter and confirm the password. Then exit the PostgreSQL client:

```bash
\q
```

---

## 📋 Execution

Run the following commands to execute locally:

The following will install required version of ruby (make sure [rvm is installed](https://rvm.io/rvm/install).)

```bash
rvm use 2.7.2
```

```bash
git clone git@github.com:JuzerShakir/rails-session.git
```

```bash
cd Session-CookieStore
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
I have deployed it on [Heroku](https://rails-session.herokuapp.com/).

---
