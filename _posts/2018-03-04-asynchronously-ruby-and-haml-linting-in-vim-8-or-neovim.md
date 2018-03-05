---
layout: post
title: Asynchronously Linting Ruby and Haml in Vim8 or NeoVim

categories:
- Vim
- Ruby
- Style

tags:
- Vim
- Vim8
- NeoVim
- ALE
- Workflow
- Linting
- Rubocop
- Haml-Lint

description: Asynchronous Ruby and Haml linting in Vim 8 or NeoVim

---
In the past I have used Syntastic in Vim for linting code while
editing. Syntastic was good, but was too slow for large projects and often felt
like it was slowing me down.ALE (Asynchronous Lint Engine) is a plugin for Vim8
and NeoVim that makes use of the new Asynchronous features introduced in Vim8 to
allow linting as you type.
Rather than linting a file when opening or saving like Syntastic, ALE will run
the linter in the background asynchronously as you type. Not only is the
feedback loop much tighter, it doesn't bog Vim down while your editing.
I have used Rubocop with Vim for linting Ruby for many years now, but never used
it for view files. I just started with a new organization and they use Haml for
views in the project that I am working on, so I was curious if there was a linter
for Haml. Sure enough I found Haml-Lint and it ties in with Rubocop to bring
the Ruby linting power of Rubocop to your Haml views. Both Rubocop and Haml-Lint
will both work with zero configuration if you have ALE installed in Vim.
Install instructions can be found in the links below, but it's really as simple
as installing both gems and adding the ALE plugin to Vim with your favorite
plugin manager.

Links:
: [ALE](https://github.com/w0rp/ale)
: [Rubocop](https://github.com/bbatsov/rubocop)
: [Haml-Lint](https://github.com/brigade/haml-lint)
