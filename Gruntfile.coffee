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
    # CoffeeScript files
    coffee:
      compileBare:
        options:
          bare: true
        files:
          'www/js/index.js':[
            'www/coffee/index.coffee'
            'www/coffee/calculator.coffee'
          ]
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
          'CooperApp/www/js/index.js': 'www/js/index.js'
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
          expand:true
          src: ['www/css/images/*']
          dest: 'CooperApp/www/css/images/'
        ]
  # Load modules for gruntjs
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-htmlhint'
  grunt.loadNpmTasks 'grunt-groc'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  # Load all Task
  # Task for test files
  grunt.registerTask 'test', ['coffeelint']
  # Task for compile files
  grunt.registerTask 'compile', ['coffee', 'cssmin', 'uglify', 'htmlmin', 'htmlhint', 'copy']
  # Task for Documentation Code
  grunt.registerTask 'doc', ['groc']
