GITHUB_REPONAME = "danielnolan/danielnolan.github.com"
require 'jekyll'
require 'tmpdir'

desc "Generate blog files"
task :generate do
  sh "jekyll build"
end

desc "Generate and publish blog to gh-pages"
task :publish => [:generate] do

 Dir.mktmpdir do |tmp|
    cp_r "_site/.", tmp
    Dir.chdir tmp
    system "git init"
    system "git add ."
    system "git add tags -f"
    message = "Site updated at #{Time.now.utc}"
    system "git commit -m #{message.shellescape}"
    system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
    system "git push origin master --force"
  end
end
