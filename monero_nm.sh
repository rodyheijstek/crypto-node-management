# Monero Node Management script
# monero_nm.sh
#
# Usage: monero_nm.sh COMMAND
#
# Simple script for basic Monero node management
# https://github.com/rodyheijstek
# Free to use

# variables

IP=127.0.0.1
PORT=18081
METHOD=$1
PARAMS=$2

# functions

scriptMain ()
{
echo -e "$METHOD"

	if  $METHOD

	then
		echo -e "\nDone"
	else
		echo -e "\nUsage: monero.sh COMMAND"
		echo -e "\nList of known commands:\n"
		declare -F | sed 's/^.\{11\}//g' | sed -e 's/scriptMain//g'
		exit 1
	fi
}

getheight ()
{
curl -X POST http://127.0.0.1:18081/getheight -H 'Content-Type: application/json'
}

getbans ()
{
curl -X POST http://$IP:$PORT/json_rpc -d '{"jsonrpc":"2.0","id":"0","method":"getbans"}' -H 'Content-Type: application/json'
}

hard_fork_info ()
{
curl -X POST http://$IP:$PORT/json_rpc -d '{"jsonrpc":"2.0","id":"0","method":"hard_fork_info"}' -H 'Content-Type: application/json'
}

get_info ()
{
curl -X POST http://$IP:$PORT/json_rpc -d '{"jsonrpc":"2.0","id":"0","method":"get_info"}' -H 'Content-Type: application/json'
}

getblockcount ()
{
curl -X POST http://$IP:$PORT/json_rpc -d '{"jsonrpc":"2.0","id":"0","method":"getblockcount"}' -H 'Content-Type: application/json'
}

getlastblockheader ()
{
curl -X POST http://$IP:$PORT/json_rpc -d '{"jsonrpc":"2.0","id":"0","method":"getlastblockheader"}' -H 'Content-Type: application/json'
}

get_connections ()
{
curl -X POST http://$IP:$PORT/json_rpc -d '{"jsonrpc":"2.0","id":"0","method":"get_connections"}' -H 'Content-Type: application/json'
}

get_transaction_pool ()
{
curl -X POST http://$IP:$PORT/get_transaction_pool -H 'Content-Type: application/json'
}

stop_deamon ()
{
curl -X POST http://$IP:$PORT/stop_daemon -H 'Content-Type: application/json'
}

start_deamon ()
{
/home/monero/monero-v0.11.1.0/monerod --detach
}

# script

echo -e "\n############################\n# Monero Node Management script\n# Running function: $1\n############################\n"

if [ $METHOD = 'scriptMain' ];
	then
	echo -e "\nF this."
	exit 1
	else
	scriptMain
fi

exit 0
