layout: page
title: "PAGE-TITLE"
permalink: /URL-PATH

# En side
Hvor haner du ...
Og posting ...

Noe info  i eksperimentet  
  
Mye på en gang, kramdown, rabit hole, jekyll og sikkert noe mer.  
github har mye på gang, enkel presntert, men litt mer arbeid å få til om en ikke følger instruksjoner riktig.  
Eneste målet er en nettside som kan vises, der sluttbruker kan finne fram, og der TOC er benyttet.  
Eneste agenda er å vise noen prosjektfiler...  
  
Lenker til browser TAB nå.  
https://jekyllrb.com/docs/step-by-step/01-setup/  
https://nzrunner.github.io/home-assistant/github/2023/03/28/github-pages-and-jekyll-frustration-central.html  
https://github.com/nzrunner/home-assistant/blob/master/README.md  
https://github.com/nzrunner/home-assistant/blob/master/README.md?plain=1  
  
  
https://kvapehe.github.io/cliogkoding/  
https://kramdown.gettalong.org/ -> https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/setting-a-markdown-processor-for-your-github-pages-site-using-jekyll  
https://jekyllrb.com/docs/posts/  
https://jekyllrb.com/docs/liquid/tags/#linking-to-posts  
https://jekyllrb.com/docs/front-matter/  
https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/adding-content-to-your-github-pages-site-using-jekyll   
https://github.com/kvapehe/cliogkoding/settings/pages   
https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site  
  
https://pages.github.com/  
https://nzrunner.github.io/home-assistant/github/2023/03/28/github-pages-and-jekyll-frustration-central.html  
https://github.com/nzrunner/home-assistant/blob/master/README.md  
https://github.com/nzrunner/home-assistant/blob/master/README.md?plain=1  
  
https://kvapehe.github.io/cliogkoding/  
https://kvapehe.github.io/cliogkoding/  
https://github.com/kvapehe/cliogkoding/wiki/Innlevering  
https://annuel2.framapad.org/p/kvavg2data02  
https://duckduckgo.com/?t=ffab&q=jekyll+github+pages&ia=web  
  
  
https://kramdown.gettalong.org/  
  
	  
	https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll  
$ cd PARENT-FOLDER  
$ git init REPOSITORY-NAME  
> Initialized empty Git repository in /Users/octocat/my-site/.git/  
# Creates a new folder on your computer, initialized as a Git repository  
$ cd REPOSITORY-NAME  
# Changes the working directory  
$ mkdir docs  
# Creates a new folder called docs  
$ cd docs  
$ git checkout --orphan gh-pages  
# Creates a new branch, with no history or contents, called gh-pages, and switches to the gh-pages branch  
$ git rm -rf .  
# Removes the contents from your default branch from the working directory  
$ jekyll new --skip-bundle .  
# Creates a Jekyll site in the current directory  
gem "github-pages", "~> GITHUB-PAGES-VERSION", group: :jekyll_plugins  
domain: my-site.github.io       # if you want to force HTTPS, specify the domain without the http at the start, e.g. example.com  
url: https://my-site.github.io  # the base hostname and protocol for your site, e.g. http://example.com  
baseurl: /REPOSITORY-NAME/      # place folder name if the site is served in a subfolder  
  
git add .  
git commit -m 'Initial GitHub pages site with Jekyll'  
  
$ git remote add origin https://github.com/USER/REPOSITORY.git  
$ git push -u origin BRANCH  
  
https://jekyllrb.com/docs/posts/  
https://nzrunner.github.io/home-assistant/github/2023/03/28/github-pages-and-jekyll-frustration-central.html  
https://nzrunner.github.io/home-assistant/github/2023/03/28/github-pages-and-jekyll-frustration-central.html
