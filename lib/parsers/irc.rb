=begin

BETTERCAP

Author : Simone 'evilsocket' Margaritelli
Email  : evilsocket@gmail.com
Blog   : http://www.evilsocket.net/

This project is released under the GPL 3 license.

=end
require_relative '../logger'
require 'colorize'

irc_user_re = r'NICK (.+?)((\r)?\n|\s)'
irc_pw_re = r'NS IDENTIFY (.+)'
irc_pw_re2 = 'nickserv :identify (.+)'

class IrcParser
    def on_packet( pkt )
        if pkt.to_s =~ /NICK\s+.+/ or pkt.to_s =~ /NS IDENTIFY\s+.+/ or pkt.to_s =~ /nickserv :identify\s+.+/
            Logger.write "[#{pkt.ip_saddr} -> #{pkt.ip_daddr} #{pkt.proto.last}]\n\n" +
                         pkt.payload.strip + "\n\n"
        end
    end
end