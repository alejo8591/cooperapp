module.exports = (grunt) ->
  # Configure Tasks
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    # CoffeeScript files
    coffee:
      compile:
        files:
          'www/js/index.js':'www/coffee/index.coffee'
    # Generate Documentation with Docco and Groc
    groc:
      coffeescript: [
      	"www/coffee/*.coffee"
      	"index.md"
      ]
      options:
        "out": "doc/"
    # uglify for JS files
    uglify:
      options:
      	# infor in package.json
        banner: '/*! Desarrollado por <%= pkg.author %> of <%= pkg.company %> [dat] co  */\n/*! <%= pkg.name %>: Version <%= pkg.version %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      my_target:
        files:
          'CooperApp/www/js/index.js': 'www/js/index.js'
    # minified for HTML files
    htmlmin:
      dist:
        options:
          removeComments: true
          collapseWhitespace: true
        files:
          'CooperApp/www/index.html': 'www/index.html'
  # Load modules for gruntjs
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-groc'
  # Load all Task
  # Task for compile files
  grunt.registerTask 'compile', ['coffee', 'uglify', 'htmlmin']
  # Task for Documentation Code
  grunt.registerTask 'doc', ['groc']
