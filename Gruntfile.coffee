module.exports = (grunt) ->
  # Configure Tasks
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    # CoffeeScript files
    coffee:
      compile:
        files:
          'www/js/index.js':'www/coffee/index.coffee'
    # Generate Documentation
    #jsdoc: 
      #dist:
        #src: ['www/js/*.js']
        #options: 
          #destination: 'doc'
    #docco:
      #debug:
        #src: ['www/coffee/*.coffee']
        #options:
          #output: 'doc'
    groc:
      coffeescript: [
      	"www/coffee/*.coffee"
      	"README.md"
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
  grunt.loadNpmTasks 'grunt-jsdoc'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-groc'
  # Load all Task
  grunt.registerTask 'compile', ['coffee', 'uglify', 'htmlmin']
  grunt.registerTask 'doc', ['groc']
