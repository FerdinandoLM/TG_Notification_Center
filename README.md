# Telegram Notification Center

----------

## What is this?

This is a bot that runs on your personal account, that notifies you on a chat you define about mentions and replies. It also forwards the message so you won't miss it.

Never miss a reply or a direct mention anymore.

----------

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

## Setting up the Notification Center:

To run this plugin you must install a bot and login with the telegram account that you want to monitor. You may run as a normal bot, but you won't be able to check replies torwards your account.
You will instead be notified if someone replies to your bot.
Also, running it as a bot needs that you add that bot inside every group you want to be notified of.

1. Create a bot using BotFather on telegram: t.me/BotFather
2. Create a group with you and your new bot, to make it nicer, call it "Notification Center"
Notice: (There is no need to put the bot inside other groups except the notification center)
3. Get the group ID of the group, there are many bots doing that on telegram. Otherwise, one other way get it, is to use the [id.lua plugin from original yagop bot](https://github.com/yagop/telegram-bot/blob/master/plugins/id.lua)

4. Edit the /plugins/notificationcenter.lua file as follows:

      a. Put the group ID on the variable ```receiverid``` and ```receiverid2``` , example: ``` receiverid = 'chat#id1234567' ```

      b. Search for ```"alpha"```, ```"beta"``` and ```"delta"``` and change them with anything you want (keep the quotation marks).
      For example i use many versions of my name, my nickname and things like that in order to keep track when people try to call me without ```@nickname``` trigger.
      The reply checker simply checks if someone replies to your messages. Note that this only works if you're using the bot under your personal account, and won't work if operating under Telegram Bot APIs

      c. Copy the BOT API Key you got from BotFather and put it on the var ```bottoken``` example: ```bottoken = "123456789:ABCD1234jklmnOPQ56789xyz"```

  5.  Restart the bot and you're all set.

  To disable one of the features change the value of ```local mcheck = "1"``` and ```local rcheck = "1"```
  To "0". ```mcheck= "0"``` disables mentions checking, ```rcheck = "0"``` disables replies checking (it's simple: 1 = enabled; 0 = disabled)

----------

## Picture(s)

  ![1](http://i.imgur.com/Ocesb58.png)
  An example of a mention and a reply. As you can see there is a message sent from the bot and a forward of the message made from yourself

----------

## Credits

A Telegram Bot based on plugins using [tg](https://github.com/Rondoozle/tg). Forked from [LucentW's s-uzzbot](https://github.com/LucentW/s-uzzbot), which is forked from [uziins' uzzbot](https://github.com/uziins/uzzbot), which is forked from [Yagop's](https://github.com/yagop/telegram-bot).

----------

## Version
Version: ```4.2.2```
Version date: ```2017-08-23```
Version codename: ```TwinBot```

----------