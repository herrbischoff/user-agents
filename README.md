# User Agent Database

## About

This is a constantly updated collection of user agents I encountered while
running web servers on the internet. It's not an exhaustive list. It instead
focuses on bots, crawlers, certain malware, automated software, scripts and
uncommon ones. Lists of regular browser user agents are available elsewhere
and too numerous to sanely and cleanly manage.

## Usage

There are lots of use cases for user agent information, especially when parsing
web server logs. Below are some examples that illustrate how to quickly get
filtered information out of this data set using the excellent [jq][jq]
command-line tool.

### Get SEO User Agents
```
cat data/*.json | jq -r 'select(.category==7) | .user_agents[]'
```

### Get Chinese Crawlers
```
cat data/*.json | jq -r 'select(.country=="CN") | select(.type==2)  | .user_agents[]'
```

### Get Suspicious CIDRs
```
cat data/*.json | jq -r 'select(.type==99) | .known_cidrs[]'
```

## Contributing

To get a list of all encountered user agents you can run a command like
```
cat /var/log/nginx/* | awk -F\" '{print $6}' | sort -u > uas.txt
```
* Create a single file JSON entry per entity. Use `template.json` to start. The
  `new.sh` helper script is great for this.
* Index codes are listed in folder `indexes`.
* Fill out as much information as possible, use existing entries for reference.
  Be especially thorough regarding country, website and description.
* Format with Prettier. The default style is sufficient. You can do so by
  installing it (`npm install -g prettier`) and running `prettier --write
  entry.json`.
* If there are multiple mostly identical user agent strings for an entry,
  restrict to one example per major [semantic version][semver].
* All array entries are sorted, alphabetically and numerically.
* If `country` does not apply or is international, use country code `ZZ`.

## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/80x15.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

The data is completely free for personal, non-commercial usage, including FOSS 
projects. If you plan to include it in a product you earn money on or use for 
infrastructure you earn money with, I welcome your decision. However, you will 
need to license it by becoming a permanent [top-tier GitHub sponsor][sponsor]. 
If this is too steep for you, [let me know][email] and we'll talk.

[jq]: https://stedolan.github.io/jq/
[semver]: https://semver.org
[sponsor]: https://github.com/sponsors/herrbischoff
[email]: mailto:marcel@herrbischoff.com
