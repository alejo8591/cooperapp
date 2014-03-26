## 1. Install Development Environment

#### 1.1 Installing NodeJS

[Download the Node.js source code or a pre-built installer for your platform](http://nodejs.org/download/), and start developing today.

> For a basic tutorial NodeJS [see the link below](http://nodeguide.com/beginner.html).

#### 1.2 Installing CoffeeScript
CoffeeScript is a little language that compiles into JavaScript. Underneath that awkward Java-esque patina, JavaScript has always had a gorgeous heart. CoffeeScript is an attempt to expose the good parts of JavaScript in a simple way.

`$ sudo npm install -g coffee-script`

> For a basic tutorial CoffeeScript [see the link below](http://coding.smashingmagazine.com/2013/10/29/get-up-running-grunt/).

#### 1.3 Installing the CLI for GruntJS

###### Why use a task runner?
In one word: automation. The less work you have to do when performing repetitive tasks like minification, compilation, unit testing, linting, etc, the easier your job becomes. After you've configured it, a task runner can do most of that mundane work for you—and your team—with basically zero effort. 

###### Install GruntJS

`$ sudo npm install -g grunt-cli `

> For a basic tutorial GruntJS [see the link below](http://coding.smashingmagazine.com/2013/10/29/get-up-running-grunt/).

#### 1.4 Installing sublime-coffee-compile for Sublime Text 2/3

To install CoffeeCompile, simply use [Package Control](http://wbond.net/sublime_packages/package_control).

You'll need to setup some paths in the settings file before you can use the plugin. Instructions are
included in the settings file, don't worry! The settings file can be accessed through this menu:
`Sublime Text > Preferences > Package Settings > CoffeeCompile > Settings - User`

For MacOSX configure node_path and coffee_path*:
```javascript
{
"node_path": "/usr/local/bin/",
"coffee_path": "/usr/local/bin/"
}
```
*For problems with plugin on MacOSX or Linux [Visit the link](https://github.com/surjikal/sublime-coffee-compile/issues/30)

##### Run the CoffeeCompile plugin and you should see appear: 

![alt text](https://github-camo.global.ssl.fastly.net/56da0e7db09cda09628c5c6c58965c8c3169e79a/687474703a2f2f692e696d6775722e636f6d2f324a3439512e706e67 "Firefox OS Simulatro")


#### 1.5 Installing Firefox OS Simulator for Test App

To install the simulator just load up Firefox and head to [the simulator download page(FirefoxOS simulator 1.x stable and ADB Helper)](https://ftp.mozilla.org/pub/mozilla.org/labs/fxos-simulator/). From there you can install it to Firefox OS. Hit the button on the left of the simulator dashboard to run the simulator and you should see the “device” appear:

![alt text](http://cl.ly/image/2k2T2X3E3S1f/Screen%20Shot%202013-07-01%20at%2011.42.08.png "Firefox OS Simulatro")


#### 1.6 Installing Apache Cordova (PhoneGap)

To Install 3.4: Ensure that you have NodeJS installed, then open your commandline and run the following:

` $ sudo npm install -g phonegap `
            
Once installation completes, you can invoke phonegap on command line for further help.


> For a basic tutorial Apache Cordova (PhoneGap) and FirefoxOS [see the link below](https://hacks.mozilla.org/2014/02/building-cordova-apps-for-firefox-os/).

## 2. Project Configuration

#### 2.1 Clone Repository

` git clone git@github.com:alejo8591/cooperapp.git `

#### 2.2 Installing dependencies Package

After installing the packages and software point 1. proceed to install packages and dependencies for the development process

`$ npm install `

#### 2.3 Install and initialize project in Cordova (PhoneGap)

##### 2.3.1 Create Project
`$ cordova create cooperapp com.mobile.cooperapp "CooperApp" `

#### 2.4 Add Platform for initial Tests
`$ cordova platform add firefoxos `


## 3. Documentation

[Groc](http://nevir.github.io/groc/) takes your documented code, and in an admission that people aren't machines, generates documentation that follows the spirit of literate programming. Take a look at the self-generated documentation, and see if it appeals to you!

It is very heavily influenced by Jeremy Ashkenas' [Docco](http://jashkenas.github.com/docco/), and is an attempt to further enhance the idea (thus, groc can't tout the same quick 'n dirty principles of docco).

###### Generate Documentation using [Groc](http://nevir.github.io/groc/)

[Groc](http://nevir.github.io/groc/) In our case we use to generate project documentation with a task through GruntJS:

##### 3.1 Installing Groc Tools

`$ npm install grunt-groc`

##### 3.2 Generate Documentation using Groc

The task is carried out in our called `doc` in the `Gruntfile.coffee` file:

`$ grunt doc`

## 4. Versioning

For transparency and insight into our release cycle, and for striving to maintain backward compatibility, Bootstrap will be maintained under the Semantic Versioning guidelines as much as possible.

Releases will be numbered with the following format:

` <major>.<minor>.<patch> `

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor and patch)
* New additions without breaking backward compatibility bumps the minor (and resets the patch)
* Bug fixes and misc changes bumps the patch

For more information on SemVer, please visit http://semver.org/.


## 5. Bug tracker

Have a bug or a feature request? [Please open a new issue](https://github.com/alejo8591/cooperapp/issues). 
+ **¡Allow For!** Before opening any issue, please search for existing issues and read the [Issue Guidelines](https://github.com/necolas/issue-guidelines), written by [Nicolas Gallagher](https://github.com/necolas/).


