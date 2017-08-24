--- Telegram Notification Center!
---
--- version: 4.2.2
--- version date: 2017-08-23
--- version codename: TwinBot
---
--- Changelog: 
---	    2017-08-23 
---			- Now uses a bot alongside the personal account
---	
---		2016-08-05
---			- Now checks replies 
---			- Now with breaklines on the alert message, for better reading
---			- Changing repository to https://github.com/FerdinandoLM/telegram-bot-lua-plugins
---
--- 	2015-10-01
---			- Now checks if the user triggering has a nickname
--- 		- Now says chat id
---
--- Telegram Notification Center is a plugin that let you create a sort of Notification Center for telegram
--- 
--- To run this plugin you must install a bot and login with the telegram account 
--- that you want to monitor. You may run as a normal bot
--- but you won't be able to check replies torwards your account. 
--- You will instead be notified if someone replies to your bot.
--- 
--- HOW TO USE
--- 
--- Change "NAME", "SURNAME" and "MIDDLE" with anything you want. 
--- For example i use many versions of my name, my nickname and things like that
--- In order to keep track when people try to call me without @nickname trigger
--- The reply checker simply checks if someone replies to your messages.
--- 
--- Create a bot using BotFather on telegram: t.me/BotFather 
--- 
--- Create a group with you and your new bot, to make it nicer, call it "Notification Center"  
--- Notice: (There is no need to put the bot inside other groups except the notification center)
--- 
--- Find the id of the group 
--- One way to do is to use the id.lua plugin from original yagop bot 
--- https://github.com/yagop/telegram-bot/blob/master/plugins/id.lua
---
---

---
--- The group id is a number string you must replace
---
---			receiverid = 'chat#id1234567'
---
--- reboot the bot and you are good to go
--- 
---
--- To disable one of the features change the value of local mcheck = "1" and local rcheck = "1"
--- To "0". mcheck= "0" disable mentions checking, rcheck = "0" disables replies checking


local function run(msg)


--- Declaring stuff
notificationgroup = '1234567'
--- Put the chat id where you want to receive the notifications.
local bottoken = "123456789:ABCd1XGSKK9dkx6l3dft33EXAMPLE"
--- Put the BOT API KEY.


--- Declares
receiverid = 'chat#id'.. notificationgroup 
receiverid2 = '-'.. notificationgroup
local text = string.lower(msg.text)
local origin = get_receiver(msg)
local chat_id = msg.to.id
local chat_name = msg.to.print_name
local mentionflag = msg.mention
local msgflag = msg.flag

-- Empty user name check
if not msg.from.username then
	from_username = "" .. msg.from.print_name
else
	from_username = ('@' .. msg.from.username)
end
--- End of empty user name check ---

--- Running plugin check ---
if string.find(text, "notificationcentercheck") or string.find(text, "telegramnotificationcentercheck") then
local botanswers = {from_username .." Telegram Notification Center check ok: https://github.com/FerdinandoLM/TG_Notification_Center"}
return botanswers[math.random(#botanswers)]
end

--- End of running plugin check ---

--- Checking for trigger words ---
if string.find(text, "alpha") or string.find(text, "beta") or string.find(text, "delta") then
	local mcheck = "1"
		if string.find(mcheck, "1") then
			texttosend='You got mentioned by ' .. from_username .. '\n\nUser ID:' .. '\n\nChat name:' .. chat_name .. '\n\nChat id: ' .. chat_id .. '\n\n Time:' .. os.date("%c")
			local ignorecheck = "1"
                if string.find(ignorecheck, "1") then
					if string.find(chat_id, notificationgroup) then 
						texttosend=''
						msg.id="0"
						receiverid="0"
						else
						end
			end 
			do 
				fwd_msg(receiverid, msg.id, ok_cb, false) 
			end
			do 
				os.execute('curl --data chat_id='..receiverid2..' --data-urlencode "text='..texttosend..'"  "https://api.telegram.org/bot'..bottoken..'/sendMessage" ')
				return
			end
		end

--- Checking for replies ---
elseif msg.mention then
	local rcheck = "1"
		if string.find(rcheck, "1") then 
			texttosend='# You got replied by ' .. from_username .. '\n\nUser ID:' .. '\n\nChat name:' .. chat_name .. '\n\nChat id: ' .. chat_id .. '\n\n Time:' .. os.date("%c")
			do 
				fwd_msg(receiverid, msg.id, ok_cb, false) 
			end
			do 
				os.execute('curl --data chat_id='..receiverid2..' --data-urlencode "text='..texttosend..'"  "https://api.telegram.org/bot'..bottoken..'/sendMessage" ')
				return
			end
		end
--- end of replies --
-- end of notifier --
else
	return
end 
end

return {
 description = "Notification Center",
 usage = "Get notified when someone says your name or replies to you",
 patterns = {
 "^(.+)$"
 }, 
 run = run 
}
