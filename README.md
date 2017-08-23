# Telegram Notification Center
============

## What is this? 

This is a bot that runs on your personal account, that notifies you on a chat you define about mentions and replies. It also forwards the message so you won't miss it. 

Never miss a reply or a direct mention anymore. 

============  

## [Installation](https://github.com/yagop/telegram-bot/wiki/Installation)

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

============  

## Setting up the Notification Center:

To run this plugin you must install a bot and login with the telegram account that you want to monitor. You may run as a normal bot, but you won't be able to check replies torwards your account.
You will instead be notified if someone replies to your bot.
Also, running it as a bot needs that you add that bot inside every group you want to be notified of. 

1. Create a group with you and your new bot, to make it nicer, call it "Notification Center"
2. Get the group ID of the group, there are many bots doing that on telegram. Otherwise one other way to do this is to use the id.lua plugin from original yagop bot 
 https://github.com/yagop/telegram-bot/blob/master/plugins/id.lua
3. Edit the /plugins/notificationcenter.lua file as follows: 

      a. put the group ID on the variable receiverid , example: ``` receiverid = 'chat#id1234567' ```  
      
      b. Search for "NAME", "SURNAME" and "MIDDLE" and change them with anything you want.  
      For example i use many versions of my name, my nickname and things like that in order to keep track when people try to call me without ```@nickname``` trigger.
      The reply checker simply checks if someone replies to your messages. Note that this only works if you're using the bot under your personal account, and won't work if operating under Telegram Bot APIs 

4. Restart the bot and you're all set.



============ 


============ 

## Credits  
 
A Telegram Bot based on plugins using [tg](https://github.com/Rondoozle/tg). Forked from [LucentW's s-uzzbot](https://github.com/LucentW/s-uzzbot), which is forked from [uziins' uzzbot](https://github.com/uziins/uzzbot), which is forked from [Yagop's](https://github.com/yagop/telegram-bot).

============  


