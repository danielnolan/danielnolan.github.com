---
layout: post
title: My winter deep dive into home automation

description: As my outdoor activties shift from outdoor to indoors for
    the winter, I have taken a deep dive into IoT, home automation, and
    networking.

categories:
- Home Automation
- IoT

tags:
- Home Assistant
- IoT
- Smart Home
- Home Networking

---
As winter rolls in, my house projects and hobbies have mostly
shifted indoors. I've become fascinated with IoT and home automation.
I mean, I have dabbled in IoT and home automation for
quite some time with hue light bulbs, nest thermostat, nest audio,
robot vacuum, and a few other "smart home" devices managed via the Google
Home app. I had some routines setup in Goggle Home that were helpful, such as saying
goodnight and it would turn off all of the lights and lock the back door;
however, their routines were still lacking conditions. I was super stoked when [Google
announced] they were adding scripting to Google Home app for
creating conditional automations. As soon as it released, I quickly setup an
automation for turning on the backyard string lights when my girlfriend or I
arrive at home after sundown. We tested this out over a couple weeks
and we were quickly let down. It was not reliable at all, even with letting the
Google Home app always track our iPhone location. I knew there had to be
a better way and if you are a tinkerer there definitely is. It's a very
popular open source project called [Home Assistant]. Over the past couple
months I have gone down the rabbit hole of Home Assistant, learning about
why local control is better, adding local controlled devices to our home, and
weaning myself off of home cloud services. You can run Home Assistant on all
types of hardware including a raspberry pi. I ended up buying a
[Home Assistant Yellow] from [Nabu Casa] for my install since it supports on
going development, and has several nice features that you wouldn't get
just running it on a raspberry pi. After getting Home Assistant setup and the
integrations needed for my devices installed, I setup the same automation I
had tried with Google Home. This automation now works reliably turning on the
string lights in the backyard when either of us arrive home after sundown.
The best part of this Home Assistant automation is it not only uses GPS for
home/away detection, but I also have it setup to use the main home WiFi to
detect if a device is home or not. Now I'm totally hooked.
I've added several [Shelly] devices that are all configured locally and don't
need to connect to a cloud service. Shelly relays are great for making
regular light switches or outlets smart without changing the switch or
plug. I also purchased a [ratgdo] for full local control of my garage door opener
after the whole [chamberlain/myq debacle]. It works great and gives more
features, like being able to open the garage door to a certain
percentage.
I've even been able to give back to the Home Assistant community already
opening a [pull request] to fix a small issue with an integration that I'm
using for our Mila air purifier.

Adding all these new devices to our network then led to a deep dive into networking.
Lots of IoT devices on a regular home network can not only cause performance issues,
but there are also some privacy and security concerns to be aware of. After a ton of
reading I decided it was out with Google WiFi and in with [tp-link Omada].
I needed something that was more robust than a typical consumer home
router so I could setup a vpn and vlans. I also wanted it to have an
integration for Home Assistant to allow for device tracking, this is what led me to Omada.
We now have 3 networks in our house: main, IoT, and guest. I
still may add a 4th called NoT for devices that just need to be on the
network, but don't need internet access. All of the separate vlans all
have their own WiFi ssid with passwords. Our main vlan
now only has devices like our laptops and phones. The guest and IoT vlans are
walled off from each other and from the main vlan, yet things like airplay and
casting still work across vlans via mdns.
I bought a tld .house domain for the house with sub domains for each of the vlans.
DNS for our network is now handled by a raspberry pi running [pi-hole] for ad blocking.
On that same raspberry pi I'm running core-dns for local device name
resolution from my omada router. This requires using a [custom core-dns plugin].
I also configured a VPN so we can securely get on our home network when not at
home. All of the network gear is connected to UPSs so it will stay
powered up if we lose power. I also added an LTE modem that my router will fail over to if the
main cable internet goes out.

I know this is only the beginning, there is so much more to dive into
and I have all kinds of ideas for things I'd like to automate. I'll try
to do more posts about my setup over the next few months.


[Shelly]: https://shelly.com
[Google announced]: https://www.googlenestcommunity.com/t5/Blog/Create-powerful-automations-with-our-new-script-editor-now-available-in/ba-p/433461
[Home Assistant]: https://www.home-assistant.io/
[Home Assistant Yellow]: https://www.home-assistant.io/installation/#extend-with-home-assistant-yellow
[Nabu Casa]: https://www.nabucasa.com/
[tp-link Omada]: https://www.tp-link.com/us/omada-sdn/
[custom core-dns plugin]: https://github.com/dougbw/coredns_omada
[pi-hole]: https://pi-hole.net/
[chamberlain/myq debacle]: https://9to5mac.com/2023/11/08/chamberlain-myq-blocks-homebridge/
[ratgdo]: https://paulwieland.github.io/ratgdo/
[pull request]: https://github.com/sanghviharshit/ha-mila/pull/32
