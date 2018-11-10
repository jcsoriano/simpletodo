# Features

 - Add, edit, delete tasks
 - Mark tasks as done / undone
 - Records all activities done
 - Hide / show completed tasks

# Stack, Frameworks, and Libraries used

 - PHP
 - MySQL
 - Laravel 5.7
 - Vue 2.5
 - Bulma 0.7
 - Buefy 0.7

# Additional features

 - Snappy front-end processing with background-syncing (the front-end state is updated immediately while the request happens behind the scenes. Failures are handled appropriately.)
 - Follows PSR-2 code style for PHP
 - Follows NPM code style for javascript
 - Well-commented code
 - Uses mixins for Vue and traits for PHP to DRY functionality
 - Makes use of Laravel model events for recording history
 - Makes use of route model binding for concise code
 - Makes use of both front-end and back-end validations

# Installation

1. `CREATE DATABASE homestead` in mysql
1. Rename .env.example to .env, and update database credentials if necessary
2. Do the following:

```
composer update
php artisan key:generate
php artisan migrate
```