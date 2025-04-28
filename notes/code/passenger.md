`sudo pacman -S passenger`

Add `/usr/lib/passenger/bin` to `$PATH`

e.g.:
```.zshrc
export PATH="$PATH:/usr/lib/passenger/bin"
```

### a node server

`passenger start --app-type node --startup-file server.js
### on planethoster

[planethoster documentation](https://kb.n0c.com/knowledge-base/gestion-des-applications-node-js/)

[cloud-linux documentation](https://docs.cloudlinux.com/cloudlinuxos/command-line_tools/#node-js-selector)

```
source /home/ncyujthp/nodevenv/app/quests/22/bin/activate
```

```
/usr/sbin/cloudlinux-selector start --json --interpreter=nodejs --app-root=/home/ncyujthp/app/quests
```

```
/usr/sbin/cloudlinux-selector run-script --json --interpreter=nodejs --app-root=/home/ncyujthp/app/quests --script name=standalone
```

### with next start ?

https://web.archive.org/web/20240705063032/https:/infinum.com/handbook/frontend/react/recipes/passenger-setup