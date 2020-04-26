# PuppyLuv

## Table of Contents
1. [Overview](#Overview)
2. [Project Objective](#Project-Objective)
3. [Paper Mockups](#Paper-MockUps)
4. [Schema](#Schema)

## Overview
### Description
PuppyLuv is an app that helps dog-finders decide what dog is perfect for them. The user has the ability to sign in as to save their results. The results would relate to a quiz that the user can take asking various questions, such as whether they want an active dog or what size dog they would prefer. Once the quiz is completed, there will be a results page that would display the top 5 or 10 dog breeds; they can swipe right to like the breed or left to dislike it (like a puppy Tinder). The results will save to the user's profile. There will also be an option to display a map showing the closest dog adoption centers relating to the user's current or given location. The user will also be able to change certain simple settings for their profile.

### Members of the team
- Rosario Araujo
- Athena Enosara
- Pernille Dahl

### App Evaluation
- **Category:** entertainment
- **Mobile:** 
- **Story:** find the perfect dog breed
- **Market:** dog-lovers, dog-owners
- **Habit:** 
- **Scope:**

## Product Spec

### 1. User Stories (Required and Optional)
**Required Must-have Stories**
- [x] user will be able to sign in or sign up
- [x] user will have the ability to navigate with a bottom tab bar to: home, quiz, map, and profile
- [x] user will have the ability to take the quiz
- [x] results of the quiz will be shown
- [ ] there will be a map showing the closest dog shelters
- [x] user will have a profile page
- [x] user can like breed from feed
- [x] user can upload their own puppy images to feed 
- [x] user can comment on posts in the feed 
- [x] user can view a collection view of their liked dogs
- [x] error message shown to user if log in with wrong username or password

**Optional Nice-to-have Stories**
- [ ] user can change the map to a list view of the closest shelters
- [x] user can change their profile name in settings
- [x] user can change their profile picture in settings
- [ ] sign in will have a forgot password?
- [x] quiz can save progress

### 2. Screen Archetypes
* launch page
   * our made logo in white with colored background
* login view controller
   * logo
   * username label / text field
   * password label / text field
   * sign in button
   * sign up button
* home view controller
  * show what PuppyLuv is about
  * give ability to go to quiz with a button
  * ability to to straight to the profile page
* quiz view controller
  * ability to take quiz and go back/next on questions
  * shows an image/illustrations to go with each question/selection
  * shows results on next page connecting only to quiz view controller (where breeds can be liked/disliked)
* map view controller
  * shows results
  * changes to list view (and back)
* profile view controller
  * shows saved likes/dislikes
  * displays profile picture/name

### 3. Navigation
**Tab Navigation** (Tab to Screen)
* home
* quiz
* feed 
* map
* profile

**Flow Navigation** (Screen to Screen)
* Login
   * Sign In
   * Sign Up
* Home
   * Take Quiz
   * Finish setting up your profile
* Quiz
  * Previous question (when question #2+)
  * Next question (when question #n-)
  * Results when finish button pressed (on last question)
  * == *Results* ==
    * swipe right/left to like/dislike
    * press given buttons to like/dislike
* Map
  * List View (and back to map view)
* Profile
  * Settings (and back to profile)

## Wireframes
<img src="https://imgur.com/L4ZCzQo.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups
<img src="https://imgur.com/qU201Ad.jpg" width=150> <img src="https://imgur.com/kpJ099A.jpg" width=150> <img src="https://imgur.com/DyPBMKG.jpg" width=150> <img src="https://imgur.com/rQ8KBLq.jpg" width=150> <img src="https://imgur.com/L4LGRlS.jpg" width=150>

### [BONUS] Interactive Prototype
<img src='http://g.recordit.co/Jo522HQLgD.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Schema 

### Models
#### Breeds
| __Property__| __Type__   | __Decription__ |
|-------------|------------|----------------|
| ObjectId    | String | Unique id for the users|
|Breed        |String | Dog Breed |
|Weight       |String | Dog Weight |
|Lifespan     |String | Potential Dog Lifespan|
|Group        | String|  The Group the dog belongs to|
| Picture     | String|Url to a picture of a give dog |
|Description  | String | A description of a given dog |
| Grooming    |  String| How much grooming is required for a given dog  |  
|Shedding     |String | How much dog sheds|
| Energy      | String|  How energetic a dog is|
| Training    |   String | How easily a dog can be trained  | 
| Temperament | String |Dogs Personality |

#### User 
| __Property__| __Type__   | __Decription__ |
|-------------|------------|----------------|
|ObjectId    | String | Unique id for the users|
|username     | String | Name the user chooses for their account| 
|password     |  String|Password for user to access account|
|email        | String|  Email to access Account|
|display_name | String|  Displayed name on profile|
|image        | File |  User profile image|
|description  | String |  Description of the user|

#### User 
| __Property__| __Type__   | __Decription__ |
|-------------|------------|----------------|
|ObjectId    | String | Unique id for the users|
|username     | String | Name the user chooses for their account| 
|password     |  String|Password for user to access account|
|email        | String|  Email to access Account|
|display_name | String|  Displayed name on profile|
|image        | File |  User profile image|
|description  | String |  Description of the user|

#### Comments 
| __Property__| __Type__   | __Decription__ |
|-------------|------------|----------------|
|ObjectId    | String | Unique id for the users|
|post        | Pointer | Pointer to the post| 
|text        | String| The comment |
|user        | Pointer|  Pointer to the user who commented|

#### DogFeed 
| __Property__| __Type__   | __Decription__ |
|-------------|------------|----------------|
|ObjectId    | String | Unique id for the users|
|caption     | String | Caption for the post | 
|user        | Pointer| Pointer to the user posting |
|image       | File|  Image to upload to the post |
|comments    | Array | Array of comments ot the post |

#### LikedDogs 
| __Property__| __Type__   | __Decription__ |
|-------------|------------|----------------|
|ObjectId    | String | Unique id for the users|
|user        | Pointer | Pointer to the user| 
|image       | File| the file of the liked image |
|liked       | boolean| if liked or not|

#### UserResults 
| __Property__| __Type__   | __Decription__ |
|-------------|------------|----------------|
|ObjectId    | String | Unique id for the users|
|results     | String | The results from the quiz| 
|user        | Pointer| The user who took the quiz|


### Networking
###### List of network requests by screen

* Login Screen 
    - (Read/GET) Query the user object 
    - (Read/GET) Query to check if user object is already logged in
    - (Create/POST) Save a new user object for sign up
* Quiz Screen
    - (Create/POST) Create questions for user to answer
    - (Create/POST) Display the top 5 results from the quiz 
* Map Screen
    - (Read/GET) Query all dog shelters based on zipcode
* Profile Screen
    - (Read/GET) Query logged in user object
    - (Update/PUT) Update user profile image 
    - (Read/Get) Query current user object and log out 
    - (Read/GET) Query all the dogs the user has liked and disliked 
   
