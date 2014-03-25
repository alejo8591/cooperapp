## Install development environment

#### Installing CoffeeScript

` sudo npm install -g coffee-script`

#### Installing the CLI for GruntJS

` sudo npm install -g grunt-cli `

#### Installing sublime-coffee-compile for Sublime Text 2/3

To install CoffeeCompile, simply use [Package Control](http://wbond.net/sublime_packages/package_control).

You'll need to setup some paths in the settings file before you can use the plugin. Instructions are
included in the settings file, don't worry! The settings file can be accessed through this menu:
`Sublime Text > Preferences > Package Settings > CoffeeCompile > Settings - User`

For MacOSX configure node_path and coffee_path:
```javascript
{
"node_path": "/usr/local/bin/",
"coffee_path": "/usr/local/bin/"
}
```

## Project Configuration

#### Clone Repository

` git clone git@github.com:alejo8591/cooperapp.git `

### Install and initialize project in Cordova (PhoneGap)

#### Install Cordova (PhoneGap)

#### Create Project
` cordova create cooperapp com.mobile.cooperapp "CooperApp" `

#### Add Platform for initial Tests
` cordova platform add firefoxos `

## Versioning

For transparency and insight into our release cycle, and for striving to maintain backward compatibility, Bootstrap will be maintained under the Semantic Versioning guidelines as much as possible.

Releases will be numbered with the following format:

`<major>.<minor>.<patch>`

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor and patch)
* New additions without breaking backward compatibility bumps the minor (and resets the patch)
* Bug fixes and misc changes bumps the patch

For more information on SemVer, please visit http://semver.org/.


## Bug tracker

Have a bug or a feature request? [Please open a new issue](https://github.com/alejo8591/cooperapp/issues). 
+ **¡Allow For!** Before opening any issue, please search for existing issues and read the [Issue Guidelines](https://github.com/necolas/issue-guidelines), written by [Nicolas Gallagher](https://github.com/necolas/).


