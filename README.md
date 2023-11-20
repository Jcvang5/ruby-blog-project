# Blog App README

Welcome to the Blog App! This application offers a platform for effortless creation, reading, updating, and deletion of blog posts.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)

### Introduction
The Blog App is a web application designed for efficient blog post management. Users can easily perform CRUD operations on their blog posts through a user-friendly interface. The authentication system ensures secure actions by authorized users.

### Features
1. *CRUD Operations:* Effortlessly create, read, update, and delete blog posts.
2. *User Authentication:* Secure user accounts with authentication for data protection.
3. *Intuitive UI:* Streamlined interface for efficient blog management.
4. *Category Count:* Display of the number of articles within each category alongside the category name.

### Installation
To run the Blog App locally, follow these steps:

1. Before installing, refer to the ruby guides to create your blog app.
2. After completing the guide and creating a category model, follow these instructions:

   - *Step 1:* Add a column to the categories database with this terminal command:
     
     $ bin/rails generate migration AddDescriptionToCategories description:string
     
   - *Step 2:* Backfill existing categories with descriptions. Run the Rake task using the following terminal command inside your blog directory:
     
     rake db:add_description_categories