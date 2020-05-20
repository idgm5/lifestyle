# The Station - A news website for gamers

> This a captsone project for the Microverse Program, all the requirements and design concepts are included.

![screenshot](https://i.imgur.com/rDtZxvw.png)

## Built With

- Ruby v2.7.0
- Ruby on Rails v6.0
- CSS Flexbox

## Live Demo

[Hosted on Heroku](https://thestation.herokuapp.com/)

## Features
- You can create a new account using only a user name.
- You can log in with any account using the user name.
- As a user, you can create an article with a title, text, available category, and image.
- As a user, you can like (vote) for an article.
- The articles with more likes (votes) will be displayed at the frontpage, the larger picture will be available for the article with the most likes.
- The articles row will display up to 4 categories and the latest article created, also it will be ordered based on priority.
- Once you click a category you will be redirected to a page with all the articles that belong to that category.
- You can always dislike an article (unvote) and you can only like (vote) once.


## Associations are created based on this ERD
![image](https://i.imgur.com/ZNoE4tj.png)

## Extra feature
You can click on your profile once you have an account, and access to a list of all the articles that you have previously liked.

![image](https://i.imgur.com/basariC.png)

### Setup

Clone this project:
```
git clone git@github.com:idgm5/lifestyle.git
```

Install gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
rspec --format documentation

```

![image](https://i.imgur.com/Ud2qeSb.png)

## Created by

👤 **Isaac Gonzalez**

- Github: [@ghamtre](https://github.com/ghamtre)
- Twitter: [@idgm5](https://twitter.com/idgm5)
- Linkedin: [linkedin](https://www.linkedin.com/in/isaacmunguia)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

Design inspired on the [LifeStyle Magazine](https://www.behance.net/gallery/14554909/liFEsTlye-Mobile-version) a design concept created by [Nelson Sakwa](https://www.behance.net/sakwadesignstudio).
