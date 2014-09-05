---
layout: post
title: Pull Requests, Solano CI, and the Github Status API.

categories:
- Testing
- Git

tags:
- Continuous Integration
- Pull Requests
- Solano
- Testing
- Github
- Git

description: Have Solano CI update your Github pull-requests with the status of the build.

---
We use the Github pull request workflow at work, and we love it. As soon as
input is needed on the feature that is being worked on, we push up the feature
branch to Github and open a pull request. Github pull requests are great on
their own, but, what if you knew the status of the build from your continuous
integration server while reviewing the pull request? With the Solano CI & Github
Status API integration you can do just that. No coding is necessary to enable
this, simply enable the Github Commit Status permissions from within Solano and boom!
Each time you push commits to a branch on Github a build is kicked off on Solano.
Solano will post to Github&#39;s API, if there is a pull request for that branch
the build status will appear in the pull request with a link to the full
build report on Solano.

<img src="/images/github-status-api.png" alt="Github Status API" class="img-rounded">
