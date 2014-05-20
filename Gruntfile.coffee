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
    # Generate Documentation with Docco and Groc
    groc:
      coffeescript: [
      	"www/coffee/*.coffee"
      	"index.md"
      ]
      options:
        "out": "doc/"
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
    # Validate html files with htmlhint.
    htmlhint:
      html1:
        options:
          'tag-pair': true
         src:
          ['www/*.html']
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
  # Load modules for gruntjs
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-htmlhint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-groc'
  # Load all Task
  # Task for test files
  grunt.registerTask 'test', ['coffeelint', 'htmlhint']
  # Task for compile files
  grunt.registerTask 'compile', ['coffee', 'cssmin', 'uglify', 'htmlmin', 'copy']
  # Task for Documentation Code
  grunt.registerTask 'doc', ['groc']
