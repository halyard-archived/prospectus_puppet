prospectus_puppet
=========

[![Gem Version](https://img.shields.io/gem/v/prospectus_puppet.svg)](https://rubygems.org/gems/prospectus_puppet)
[![Dependency Status](https://img.shields.io/gemnasium/halyard/prospectus_puppet.svg)](https://gemnasium.com/halyard/prospectus_puppet)
[![Build Status](https://img.shields.io/circleci/project/halyard/prospectus_puppet.svg)](https://circleci.com/gh/halyard/prospectus_puppet)
[![Coverage Status](https://img.shields.io/codecov/c/github/halyard/prospectus_puppet.svg)](https://codecov.io/github/halyard/prospectus_puppet)
[![Code Quality](https://img.shields.io/codacy/1509c0d147124ec4a861ed7ad220b2e0.svg)](https://www.codacy.com/app/halyard/prospectus_puppet)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

[Prospectus](https://github.com/akerl/prospectus) helpers for checking puppet build status

## Usage

Add the following 2 lines to the .prospectus:

```
## Add this at the top
Prospectus.extra_dep('file', 'prospectus_puppet')

## Add this inside your item that has a build
extend ProspectusPuppet::Deps
```

## Installation

    gem install prospectus_puppet

## License

prospectus_puppet is released under the MIT License. See the bundled LICENSE file for details.

