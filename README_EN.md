# README
[**Japanese**](README.md)
## Application
### FashionTweet
--------------------------------------
## Application overview
### This application is a fashion site for children's clothing. With or without registration, all application visitors can view the snap list and details, and search for snaps. It is also possible to access and search external sites. Registered users can post, edit and delete snaps. It is possible to log in by SNS authentication, supports Google and Facebook.
--------------------------------------
## URL
###
--------------------------------------
## Test account
###
--------------------------------------
## How to Use
### It is supposed to be used in such cases.
- When you look at your smartphone to kill time during work breaks or breaks.
- As one of the communication tools when spending time with children at home.
- When you want to think about coordination without actually going to the store
--------------------------------------
## What can be solved
### The problem is that there are many fashion sites for adults, but few for children are difficult to find.
### The application users are as follows.
- Mothers in their 20s and 30s and their partners
- Double-income or single-parent household
- Users themselves like clothes 
### With this one application, you can search for clothes according to your child's growth by various conditions such as gender, price, item and free word.
--------------------------------------
## Requirements definition
### User registration
- By logging in, you can post, edit, and delete snaps.
- Allows comments to be posted, deleted, etc.
### User My Page
- Allows users to view a list of posted snaps and a profile.
### Post, edit, delete snaps
- Only logged-in users can post, edit, and delete snaps.
- Current users cannot edit or delete snaps other than themselves.
### Snap list and detailed view
- With or without registration, all application visitors can view the snap list and details.
### Search for snaps
- With or without registration, all application visitors can 
search for clothes by gender, price, item and free word.
- It is possible to access and search external sites.
### Post and delete comments
- Only logged-in users can post and delete comments.
- To post and delete a comment, you must log in or register.
- Current users cannot delete comments other than themselves.
### SNS authentication
- It is possible to log in by SNS authentication, supports Google and Facebook.
--------------------------------------
## Description of the implemented function

--------------------------------------
## Development environment
### Front-end
- Ruby, Ruby on Rails

--------------------------------------
### Back-end
- HTML, CSS, JavaScript, JQuery, Ajax

--------------------------------------
### Database
- MySQL, SequelPro

--------------------------------------
### Infrastructure development
--------------------------------------
### Web Server（Production environment）
--------------------------------------
### Application Server（Production environment）
--------------------------------------
### Source control
- Github, GitHubDesktop

--------------------------------------
### Test
- RSpec

--------------------------------------
### Editor
- VSCode

--------------------------------------
## Database
[![Image from Gyazo](https://i.gyazo.com/4a621b7ec7b29ce76f3026b8c0e1857e.png)](https://gyazo.com/4a621b7ec7b29ce76f3026b8c0e1857e)

### users table
| Column        | Type          | Options     |
| ------------  | --------------| ----------- |
| first_name    | string        | null: false |
| last_name     | string        | null: false |
| nickname      | string        | null: false |
| email         | string        | null: false |
| password      | string        | null: false |
| introduction  | string        |             |
| profile_image | ActiveStorage |             |

### Association
- has_many :photos
- has_many :comments


### photos table
| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| snap        | ActiveStorage | null: false                    |
| title       | string        | null: false                    |
| description | string        | null: false                    |
| price_id    | integer       | null: false                    |
| user_id     | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :photo_tags
- has_many :tags, through: :photo_tags
- has_many :comments


### tags table
| Column | Type    | Options     |
| ------ | ------- | ----------- |
| name   | integer | null: false |

### Association
- has_many :photo_tags
- has_many :photos, through: :photo_tags


### photo_tags table
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| photo_id | references | null: false, foreign_key: true |
| tag_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :photo
- belongs_to :tag

### comments table
| Column  | Type       | Options                        |
| ------  | :--------- | ------------------------------ |
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| photo   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :photo

--------------------------------------
## How to work in the local environment