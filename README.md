# LintRoller
Shared Storage and Deployment of Code Linters

# Inline Linter List
These are linters which have widespread support and are plug-n-play for most
common text editors and IDEs. It is recommended to integrate these into your
workflow for maximum happiness.

* Rubocop (with custom configuration)
* ESLint (based on airbnb/javascript rules)
* CSS Lint (with custom configuration)
* SCSS-Lint (based on airbnb/css rules)

## Rubocop Install
You may need to add relevant packages in your :development group
of a Rails Gemfile in order to ensure these gems are installed for your app-specific
Ruby version.

## ESLint Install
We're using an exported ESLint file, which requires various node dependencies.

Running the following command should pull down the required npm dependencies:

```
npm install --save-dev eslint-config-airbnb babel-eslint eslint eslint-plugin-jsx-a11y eslint-plugin-import
```

# Additional Checks
These are additional static code analysis tools which are not suitable for
running inline, usually because their checks span across files or lines.
These are instead checked by CodeClimate.

* Brakeman
* Bundler-audit
* Duplication
* Fixme
* Reek

# CodeClimate
These Lints and Static Code analysis tools are supported by CodeClimate
engines, and the included .codeclimate.yml file makes that magic happen.

If you wish to run these checks on your local machine before a Pull Request or
push upstream, the [Code Climate CLI](https://github.com/codeclimate/codeclimate)
emables that functionality through a Docker Container.  



# Deployment
