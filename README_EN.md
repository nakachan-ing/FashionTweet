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
### Snap list
[![Image from Gyazo](https://i.gyazo.com/d0a8eb301deb108cafb2a2b0de1987d4.gif)](https://gyazo.com/d0a8eb301deb108cafb2a2b0de1987d4)
- With or without registration, all application visitors can view the snap list.
- It is possible to search under various conditions in the header and sidebar.

### Search for snaps
[![Image from Gyazo](https://i.gyazo.com/93e24a46f1c2af72fe7a320a40946b5c.gif)](https://gyazo.com/93e24a46f1c2af72fe7a320a40946b5c)
- Regardless of the presence or absence of a login, snap of the search is possible.
- It enables you to search for snaps by genre, price, external site, tag, and free word.

### User registration
[![Image from Gyazo](https://i.gyazo.com/94512ef5462bf7f82ff7fad1e395a6a3.gif)](https://gyazo.com/94512ef5462bf7f82ff7fad1e395a6a3)
- If you enter the first_name, last_name, email, and password correctly, you can register a new one.
- If any of the items is empty or not entered correctly, new registration is not possible.

### User My Page
[![Image from Gyazo](https://i.gyazo.com/cc77cf68f8b4b372b6bb0243d7bdfacd.gif)](https://gyazo.com/cc77cf68f8b4b372b6bb0243d7bdfacd)
[![Image from Gyazo](https://i.gyazo.com/e7eeded143ce9335d6de6cab620332b9.gif)](https://gyazo.com/e7eeded143ce9335d6de6cab620332b9)
- In My Page, you can edit and update first_name, last_name, email, and introduction.

### Post new snap
[![Image from Gyazo](https://i.gyazo.com/8aa6c3e576007b83a61f9de691a2ff88.gif)](https://gyazo.com/8aa6c3e576007b83a61f9de691a2ff88)
[![Image from Gyazo](https://i.gyazo.com/ef5dc4ccceb8566c9d607512ad1c4949.gif)](https://gyazo.com/ef5dc4ccceb8566c9d607512ad1c4949)
- If you enter all the items correctly, you can post a new post.
- You can also register new tags on the new posting screen.
### Retail of snap
[![Image from Gyazo](https://i.gyazo.com/30b81b59e61016bc766b8cd22224eff1.gif)](https://gyazo.com/30b81b59e61016bc766b8cd22224eff1)
### Edit snap
[![Image from Gyazo](https://i.gyazo.com/e68c9d72c123a728ac82663e25c8d039.gif)](https://gyazo.com/e68c9d72c123a728ac82663e25c8d039)
### Delete snap
[![Image from Gyazo](https://i.gyazo.com/c325e9191251e0735e04bcab1290e558.gif)](https://gyazo.com/c325e9191251e0735e04bcab1290e558)
### Post new comment
[![Image from Gyazo](https://i.gyazo.com/1b147edc0641d88bbe6f6e3a67322e5c.gif)](https://gyazo.com/1b147edc0641d88bbe6f6e3a67322e5c)
### Delete comment
[![Image from Gyazo](https://i.gyazo.com/60909269e4147f06c0d98509cd838030.gif)](https://gyazo.com/60909269e4147f06c0d98509cd838030)
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
- Heroku

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