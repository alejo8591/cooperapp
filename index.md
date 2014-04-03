# Documentation Develop for CooperApp

#### 1. Clone repository from Github

`git clone git@github.com:alejo8591/cooperapp.git`


#### 2. Change branch in the local repository

Create local branch `develop`

`git checkout -b develop`

And then update the repository with changes relating to this branch

`git pull origin develop`


#### 3. Install or upgrade packages for local NodeJS

Install the packages that are in the `package.json`

`npm install`


#### 4. Scheduled Tasks and built GruntJS

In the configuration file for Gruntfile.coffee three tasks are tasks to perform explicit stages of development:

##### 4.1 The first task called `test` is reviewing the syntax and encoded files written in CoffeeScript:

Runs in REPL (command line of NodeJS):

`grunt test`

The execution of the task and the task configuration is done with the following line in the file Gruntfile.js:

```coffee-script
grunt.registerTask 'test', ['coffeelint', 'htmlhint']
```

The packages must be installed to perform this task are:

``` coffee-script
grunt.loadNpmTasks 'grunt-coffeelint'
grunt.loadNpmTasks 'grunt-htmlhint'
```

The CoffeeScript code that sets this task is:

``` coffee-script
module.exports = (grunt) ->
  # Configure Tasks
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    # Test CoffeeLint
    coffeelint:
      app: ['www/coffee/*.coffee']
      options:
        'no_trailing_whitespace':
          'level': 'error'
        'colon_assignment_spacing':
          'level': 'warn'
        'no_tabs':
          'level': 'error'
        'no_implicit_parens':
          'level': 'ignore'
        'no_empty_param_list':
          'level': 'error'
        'max_line_length':
          'level': 'ignore'
   # Validate html files with htmlhint.
   htmlhint:
     html1:
       options:
         'tag-pair': true
       src:
         ['www/*.html']
```

##### 4.2 The second task called `compile` is to compile and upload all files to the project called `CooperApp`:

Runs in REPL (command line of NodeJS):

`grunt compile`

The execution of the task and the task configuration is done with the following line in the file Gruntfile.js:

```coffee-script
# Task for compile files
  grunt.registerTask 'compile', ['coffee', 'cssmin', 'uglify', 'htmlmin', 'copy']
```

The packages must be installed to perform this task are:

``` coffee-script
grunt.loadNpmTasks 'grunt-contrib-coffee'
grunt.loadNpmTasks 'grunt-contrib-cssmin'
grunt.loadNpmTasks 'grunt-contrib-uglify'
grunt.loadNpmTasks 'grunt-contrib-htmlmin'
grunt.loadNpmTasks 'grunt-contrib-copy'
```

The CoffeeScript code that sets this task is:

``` coffee-script
module.exports = (grunt) ->
  # Configure Tasks
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    # CoffeeScript files
    coffee:
      compileBare:
        options:
          bare: true
        files:
          'www/js/index.js':'www/coffee/index.coffee'
          'www/js/calculator.js': 'www/coffee/calculator.coffee'
          'www/js/geolocation.js': 'www/coffee/geolocation.coffee'
          'www/js/login.js': 'www/coffee/login.coffee'
          'www/js/verification-login.js': 'www/coffee/verification-login.coffee'
          'www/js/create-user.js': 'www/coffee/create-user.coffee'
          'www/js/profile.js': 'www/coffee/profile.coffee'
          'www/js/edit-profile.js': 'www/coffee/edit-profile.coffee'
    #CSS minified Files
    cssmin:
      combine:
        files: 
          'CooperApp/www/css/cooperapp.min.css' : ['www/css/*.css']
    # uglify for JS files
    uglify:
      options:
      	# infor in package.json
        banner: '/*! Development or minified for <%= pkg.author %> of <%= pkg.company %> [dat] co  */\n/*! <%= pkg.name %>: Version <%= pkg.version %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      my_target:
        files:
          'CooperApp/www/js/index.js': [
            'www/js/index.js'
            'www/js/login.js'
            'www/js/verification-login.js'
            'www/js/create-user.js'
            'www/js/profile.js'
            'www/js/edit-profile.js'
            'www/js/calculator.js'
            'www/js/geolocation.js'
          ]
          'CooperApp/www/js/jquery-1.11.0.min.js': 'www/js/jquery-1.11.0.js'
          'CooperApp/www/js/jquery.mobile-1.4.2.min.js': 'www/js/jquery.mobile-1.4.2.js'
    # minified for HTML files
    htmlmin:
      dist:
        options:
          removeComments: true
          collapseWhitespace: true
        files:
          'CooperApp/www/index.html': 'www/index.html'
    # Copy images folder
    copy:
      main:
        files: [
          {
            expand:false
            src: 'www/css/images/**'
            dest: 'CooperApp/'
          }
          {
            expand:false
            src : 'www/img/**'
            dest: 'CooperApp/'
          }
        ]
```

##### 4.3 The third task called `doc` is reviewing the syntax and encoded files written in CoffeeScript:

Runs in REPL (command line of NodeJS):

`grunt test`

The execution of the task and the task configuration is done with the following line in the file Gruntfile.js:

```coffee-script
grunt.registerTask 'test', ['coffeelint', 'htmlhint']
```

The packages must be installed to perform this task are:

``` coffee-script
grunt.loadNpmTasks 'grunt-coffeelint'
grunt.loadNpmTasks 'grunt-htmlhint'
```

The CoffeeScript code that sets this task is:

``` coffee-script
module.exports = (grunt) ->
  # Configure Tasks
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    # Test CoffeeLint
    coffeelint:
      app: ['www/coffee/*.coffee']
      options:
        'no_trailing_whitespace':
          'level': 'error'
        'colon_assignment_spacing':
          'level': 'warn'
        'no_tabs':
          'level': 'error'
        'no_implicit_parens':
          'level': 'ignore'
        'no_empty_param_list':
          'level': 'error'
        'max_line_length':
          'level': 'ignore'
   # Validate html files with htmlhint.
   htmlhint:
     html1:
       options:
         'tag-pair': true
       src:
         ['www/*.html']
```
