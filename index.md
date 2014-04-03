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

##### 4.1 The first task called test is reviewing the syntax and encoded files written in CoffeeScript:

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
