is_alive_ping()
{
  ping -c 1 $1 > /dev/null
  [ $? -eq 0 ] && echo IP: $i up.
}

for i in 192.168.1.{1..255} 
do
is_alive_ping $i & disown
done