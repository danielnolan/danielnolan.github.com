---
layout: post
title: Deploy Your Jekyll Site to Github Pages With Travis CI for Free

categories:
- Ruby
- Automation

tags:
- Automated Deployment
- Git
- Travis CI
- Deployment
- Jekyll
- Github Pages

description: How I deploy the blog you are reading to Github Pages with Travis CI for free.

---

I've been using [Jekyll] for my blog for quite some time now. I have also had the
deployment of it automated for just about as long. While doing some revamping
and adding a new post a few weeks ago, I decided to update my deploy script I
had written for [Travis CI]. I was looking through the docs for Travis and low and
behold they have added the ability to deploy to Github pages with their dpl
tool. The way I was doing it worked well, but Travis [dpl] makes it dead simple,
and it can all be configured from a [.travis.yml] file in your project. Now my
blog publishing work flow goes like this. Write a post in my source branch of my
[danielnolan.github.com] repository. Commit the new post and push the source
branch to Github. Travis is configured to kick off a build when new code is
committed to the source branch on Github. Travis runs my default rake task for my
jekyll project which generates the static html for my blog and then lints it using
htmlproofer. If [html-proofer] doesn't report any errors Travis deploys my
generated html site to the master branch of [danielnolan.github.com]. If errors
are reported by [html-proofer] the build fails and my site is not deployed.
The best part about all of this is I'm able to host my site on Github pages and
use Travis to deploy it because my blog code is open source, and lives in a
public repository on Github.

[danielnolan.github.com]: https://github.com/danielnolan/danielnolan.github.com/
[.travis.yml]: https://github.com/danielnolan/danielnolan.github.com/blob/source/.travis.yml
[dpl]: https://docs.travis-ci.com/user/deployment
[Travis CI]: https://travis-ci.com/
[html-proofer]: https://github.com/gjtorikian/html-proofer
[Jekyll]: https://jekyllrb.com/
