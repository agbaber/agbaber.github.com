developer.thelevelup.com [![Build Status](https://magnum.travis-ci.com/TheLevelUp/developer.thelevelup.com.png?token=bvs1zCxYZ5mH6G9aeTSU&branch=master)](https://magnum.travis-ci.com/TheLevelUp/developer.thelevelup.com)
=========================

Development and hosting for [developer.thelevelup.com](http://developer.thelevelup.com).

Local Development
=================

To set up:

```
bundle install
nanoc compile
nanoc view
```

and visit [localhost:3000](localhost:3000) in a browser to see the site.
Then either run `nanoc compile` when you want to change files, or run

```
bundle exec guard
```

in another window to watch for changes to the nanoc config or files.

Testing
=======

Remove your output and caches and make sure the tests and output checks pass:

```
rm -rf output tmp .sass_cache
bundle exec nanoc compile
bundle exec rspec
bundle exec nanoc check internal_links stale css external_links html
```

Note that `nanoc check html` has been known to have failures due to network issues with the external
W3C Validator, so it may not work all the time. If specs all pass and nanoc doesn't report
any issues with the checks, then you should be good to submit your pull request. It's normal for
external_links to complain about links to access-restricted GitHub repos; failures on those URLs are
safe to ignore.

Review and merging workflows should follow the
[LevelUp Platform workflow guide](https://github.com/TheLevelUp/guides/blob/master/platform/workflow.md).

Deployment
=========
[Travis](https://magnum.travis-ci.com/TheLevelUp/developer.thelevelup.com/) will automatically push
the output of a successful build and test run on master to the [gh-pages](http://pages.github.com/)
branch, making it visible at [developer.thelevelup.com](http://developer.thelevelup.com/).

Adding Sections
===============

Content navigation has been automated with the `section_navigation` helper so that the site's layout
template only needs to be modified when adding a completely new section.

To add a section or subsection heading, add a metadata-only index.yaml file with `is_hidden: true`;
content in that section will be rendered under the heading in the site navigation.

```
- content/
  - support/
    - index.yaml
    - forums.md
    - contact-us.md
```

If you nest a subfolder with its own `index.yaml` file and content, the links will be rendered under
a subheading below the section heading. For example:

```
- content/
  - mobile-sdks/
    - index.yaml
    - getting-started/
      - index.yaml
      - ios.md
      - android.md
```
