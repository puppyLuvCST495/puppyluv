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
* user will be able to sign in or sign up
* user will have the ability to navigate with a bottom tab bar to: home, quiz, map, and profile
* user will have the ability to take the quiz
* results of the quiz will be shown
* there will be a map showing the closest dog shelters
* user will have a profile page
* user can like or dislike the breed results

**Optional Nice-to-have Stories**
* user can change the map to a list view of the closest shelters
* user can swipe right/left to like/dislike dog breeds
* user can change their profile name in settings
* user can change their profile picture in settings
* sign in will have a forgot password?
* quiz can save progress

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
<img src='https://imgur.com/e854v3r.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Schema 
[This section will be completed in Unit 9]

### Models
[Add table of models]
- Parse (User login and log out) 
- Will most probably use Parse for storing user results and maybe to create databases with info about breeds. 
(If not might, we might use firebase) 

### Networking
-  Dog API swift file with information about each dog breed 
-  Third part API for getting dog breeds

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

