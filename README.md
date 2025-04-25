# mxhzl.com

Hello! This is the source code for my personal website [mxhzl.com](https://mxhzl.com).

Its very simple I think. It uses a combination of the [Zola](https://www.getzola.org/) static site generator and the [Zonelets](https://zonelets.net/) site template.

The only real work I did was to adapt the zonelets template to work with Zola.

If you like the way it looks, all credit goes to Marina Kittaka, the creator of Zonelets. If you like the way it functions, all credit goes to Vincent Prouillet, the creator of Zola. Much gratitude to them both!

### Adding posts

Adding new posts is very easy! Just add a markdown file to `content/posts`. Make sure to include the `title` and `date` variables in the [front matter](https://www.getzola.org/documentation/content/page/#front-matter).

### Adding pages

Adding new pages is, shockingly, very easy! Just add a markdown file to `content`. All you need is the `title` variable. If you want the new page in the header nav, add it in [index.html](https://git.mxhzl.com/mxhzl/mxhzl.com/src/branch/main/templates/index.html).

### Testing and Deploying

Because SSGs are great, you can test the site locally by running `zola serve`. Then when you are ready to deploy, just run `zola build` and deploy the contents of the `public` directory to your site host of choice.

If you are using [neocities](https://neocities.org) as your host (which I am) you can run `./deploy.sh` and the script will build the site, run `prettier` to format the html, and then upload the contents of the `public` folder to your site.

Thanks for visiting!
