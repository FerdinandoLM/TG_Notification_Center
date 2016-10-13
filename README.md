Telegram Notification Center
============

What is this? 

This is a bot that runs on your personal account, that notifies you on a chat you define about mentions and replies.

Never miss a reply or a direct mention anymore. 

============
A Telegram Bot based on plugins using [tg](https://github.com/Rondoozle/tg). Forked from [LucentW's s-uzzbot](https://github.com/LucentW/s-uzzbot), which is forked from [uziins' uzzbot](https://github.com/uziins/uzzbot), which is forked from [Yagop's](https://github.com/yagop/telegram-bot).

[Installation](https://github.com/yagop/telegram-bot/wiki/Installation)
------------
```bash
# Tested on Debian 7, for other OSes check out https://github.com/yagop/telegram-bot/wiki/Installation
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make unzip git redis-server g++ libjansson-dev libpython-dev expat libexpat1-dev
```

```bash
# After installing the dependencies, install the bot
cd $HOME
git clone https://github.com/FerdinandoLM/TG_Notification_Center.git
cd TG_Notification_Center
./launch.sh install
./launch.sh # Will ask you for a phone number & confirmation code or just your bot token.
```

There are two more scripts to launch the bot: `launchd.sh` will run tg-cli over gdb, `launchf.sh` will take care of restarting the bot in case it crashes, deleting tg-cli's `state` file to prevent reparsing buggy/broken messages.

To enable the API bot mode, before doing `./launch.sh install`, run `touch bot_mode`.

Take in account that logging in with a bot token has some caveats: `delmsg` and `mute` do not work (API bots cannot delete messages), by reply commands such as `#promote` might misbehave, `!join` will not work (API bots can only be invited, they cannot join a group by themselves).

----------

Setting up the plugin:

TBD



