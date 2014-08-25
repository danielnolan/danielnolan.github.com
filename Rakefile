GITHUB_REPONAME = "danielnolan/danielnolan.github.com"
require 'jekyll'
require 'tmpdir'

desc "Generate blog files"
task :generate do
  system "jekyll build"
end


desc "Generate and publish blog to gh-pages"
task :publish => [:generate] do
    Dir.chdir "_site"
    system "git add ."
    system "git add tags -f"
    message = "Site updated at #{Time.now.utc}"
    system "git commit -m #{message.shellescape}"
    system "git push origin master --force"
end
