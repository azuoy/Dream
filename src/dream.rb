

ENV['SSL_CERT_FILE'] = '/etc/ssl/certs/cacert.pem'


require 'discordrb'
require 'openssl'
require 'json'
require 'resolv-replace'
require 'net/http'
require 'net/https'
require 'tempfile'
require 'mini_magick'
require 'rutui'
require 'io/console'



DEBUG = false									
	
EMBED_ERROR_COLOR = 0xe62f2f					

$boottime = 0									

$bot = Discordrb::Commands::CommandBot.new token: TOKEN , client_id: CLIENT_ID , prefix: ['k.', 'K.'], fancy_log: true, ignore_bots: false, advanced_functionality: false
$bot.should_parse_self = true

require_relative 'Security.rb'					
require_relative 'Commands.rb'										
PList = Permit.new()												
Blacklist_E926 = E621_blacklist.new(Config, "e926_blacklist")		
Blacklist_E621 = E621_blacklist.new(Config, "e621_blacklist")		

$boottime = Time.new							
puts('Current time: ' + $boottime.ctime)
puts('KhajiitBot Starting...')

$bot.ready do
	if (Config.get("game") != nil)
		$bot.game = Config.get("game")
	elsif (Config.get("watching") != nil)
		$bot.watching = Config.get("watching")
	else
		$bot.game = 'k.help'					
	end
end



trap('INT') do									
	exit
end

$bot.message(with_text: "k.hydrate", in: 569337203248070656) do |event|
	target = "<@208140167536574464>"							
	line = rand(IO.readlines("./ext/hug.action").size-3)+3		
	return event.channel.send_embed do |embed|					
		embed.description = "**<@342149093117657105>** " + eval(IO.readlines("./ext/hug.action")[line])
		embed.color = EMBED_MSG_COLOR
	end
end

def debug_puts(str)
	puts(str) if (DEBUG == true)
end


(DEBUG == true) ? ($bot.mode = :normal) : ($bot.mode = :silent)

$bot.run :async								
puts('Bot Active')							
puts('Awaiting user activity...')

while (DEBUG) do; end						

$cmdChannel = Parser.get_channel(Config.get("channel"))
$cmdServer = Parser.get_server(Config.get("server"))

$cmdChannel = ($cmdChannel)? $cmdChannel : channel_get_name($cmdChannel)
$cmdServer = ($cmdServer)? $cmdServer : server_get_name($cmdServer)
$inBuffer = ""

require_relative 'Cmdline.rb'				


