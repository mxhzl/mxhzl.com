+++
title = "A Brief Nix Experiment"
date = 2025-04-09
+++

TL;DR I tried out running NixOs on my mac laptop using VMWare Fusion. It was fun but ultimately I don't think I will use it full time to program. My config can be found [here](https://github.com/mxhzl/nixos-config).

Every now and then, I get the urge to install Linux on something.

Almost exactly a year ago (I checked) I went through a phase where I wanted to install Arch the ["Hard Way"](https://youtu.be/YC7NMbl4goo) so I ordered an [Intel NUC](https://laptopwithlinux.com/product/intel-nuc13-linux-mini-computer/) and went wild.

I am not a terribly "online" person anymore. I don't use any social networks and most of my online content I get through YouTube, and I prefer to keep that focused more on my hobbies than any professional pursuits. But occasionally things slip through the cracks and along with the video game speedruns and anime, I see a bunch of videos on technical topics. This is what led to my Arch flirtation and now its happened again.

Funnily enough it involved the same channel that created that Arch installation video, Dreams of Autonomy. I don't love like _all_ of their content, but they seem to hit more than miss, at least with me.

I've been hearing about Nix (technically the Nix package manager and NixOS _are_ separate things but for the sake of clarity I will refer to everything in the Nix ecosystem as just Nix) on and off for a while here and there. But [this video](https://youtu.be/Z8BL8mdzWHI) on using Nix as a package manager on macOS piqued my interest. I use macs at work and I have a personal laptop that I [use](@/uses.md) for any personal coding I do so I so was interested in seeing a potential replacement for the dominant package manage on mac, [Homebrew](https://brew.sh/).

So I watched the video and perused the code examples they link to, and I was unconvinced. It seemed liked there weren't a lot of packages supported in the `aarch64` Nix repos, so most of the things I want would be installed through Homebrew using a plugin that hooked it up with Nix and that plugin just creates a Brewfile, which I already [use](https://github.com/mxhzl/dotfiles_local/blob/mac/Brewfile). So it seemed like it would be a lot more work for the exact same outcome.

For example, the tool version manager I use [mise](https://mise.jdx.dev/) has an officially supported Homebrew [formula](https://formulae.brew.sh/formula/mise) that includes the most recent release, `2025.4.1`. In contrast, the community maintained [Nix package](https://github.com/NixOS/nixpkgs/blob/nixos-24.11/pkgs/by-name/mi/mise/package.nix) only supports version `2024.10.8`. Which is, obviously, not the most recent version. Its a small thing, but personally I like to install tools in the officially supported way whenever I can. Its nice to know that I can just run `brew bundle upgrade` and get the most recent versions of my packages (the `unstable` branch of nixpkgs does have a slightly newer version of mise, but I think my point stands).

So I didn't think I would be switching to using Nix as my mac package manager anytime soon. But then, the algorithm served me a YouTube short (I don't have a link sorry) about Nix that mentioned that NixOs got "endorsed" by Mitchell Hashimoto. Wait that name sounds familiar...\*types\*...ah right. Hashicorp. Makes sense. So while I was googling I found his personal [site](https://mitchellh.com/) and clicked around and ended up on his [GitHub profile](https://github.com/mitchellh) and his [NixOS config](https://github.com/mitchellh/nixos-config). I was curious, especially when he talked about how he uses NixOs. He runs it in a VM on his mac to make a dev environment that can be easily set up with a few commands and be the same across machines. Now this was an interesting use-case.

I don't have a _strong_ reason to use NixOS for programming over macOS. But I do like installing linux so I thought I would try and get it running on my mac.

The first thing I did was make it as annoying as possible for myself.

I didn't seem like I could just straight up use Mitchell's config for myself (and I didn't want to use it as-is because I wanted to understand what I was running at least a little bit plus I am sure there was some stuff in there I didn't need) so I started a new git fresh git repo. I started making files one at a time and copying over config from Mitchell's repo as I needed them, but this got annoying so I cloned his repo and `cp`'d files from the cloned repo into my new empty one. This was dumb and I should have just forked his repo to begin with. Oh well.

The next hurdle to overcome was _actually downloading VMWare Fusion_. This is not as simple as one would think. You can't just, oh say, download the app from the App Store or even their website. First of all, Fusion isn't even listed in the "Products" list on the VMWare website. You have to click a link at the bottom of that menu to even get to the page where they acknowledge that Fusion is even a product they offer. But even then you can't just click a download link. Every link takes you to the support site for VMWare's parent company and you have to make an account which is a pain and I am probably going to get annoying emails about semiconductors now. But even after you have an account, the "download" links take you to a "downloads" page in your account that is empty. You then have to click the "free software here" link and find Fusion in a list and then click through a couple more pages to finally actually start the download. So annoying I hate software goodbye.

Once I actually downloaded the dang app, the process of getting it set up with NixOS was actually pretty straightforward. The actual commands I ran are in the nixos-config repo's README if you are interested in more detail, but basically you just set the `root` user password in the VM, get the guest IP for ssh purposes, and run `make vm/bootstrap0` and `make vm/bootstap`. This will `rsync` all the config in the repo onto the VM and run the nix commands to build and configure everything. It took me a couple attempts to get the right combination of VM settings and Nix config to actually get the bootstrap commands to run to completion, but all-in-all pretty easy, especially compared to my other Linux installation experiences.

After a couple of hours of work, I had a functional NixOS virtual machine running on my mac. It was fun! However, running the VM for even a little bit brutally murdered my battery. Your mileage will certainly vary, and maybe the battery would last longer on a MacBook Pro or desktop, but my poor Air struggled.

While the setup process was enjoyable and I am definitely interested in learning more about Nix, I don't think I will be switching to NixOS for coding full-time. I might play around with it more, but right now developing with native mac tools is good enough. It would take a not-insignificant amount of time to convert my current [dotfiles](https://github.com/mxhzl/dotfiles) to be entirely contained in my NixOS config and I don't know that the time and effort would be worth it. I might do it anyway because I don't value my time.

***

If you got this far, thanks for reading! This is the first post on my new website. I don't really think I have much to say that would be interesting to anyone else, but I am committed to building and maintaining this site. I've had a few websites over the years but I think here I have a good setup. Its easy create new content since all the pages and posts are in Markdown files, and the html templates require minimal CSS and no javascript. The result is a static pure html site that is easy to host and has low environmental impact. If you are interested in seeing what I am up to now, you can check out my [now](@/now.md) and [todo](@/todo.md) pages. Thanks again! Max~
