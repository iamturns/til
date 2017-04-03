# Bash options

aka arguments, switches

```bash
function usage
{
	echo "usage: example.sh --something xxx [--debug]"
}

debug=0

while [ "$1" != "" ]; do
	case $1 in
      --something) shift; something=$1;;
      --debug) debug=1;;
      --help) usage; exit;;
      *) usage; exit 1;;
    esac
    shift
done

if [ "$something" = "" ]; then usage; exit 1; fi

if [ "$debug" = "1" ]; then
	echo "Debug mode on"
else
	echo "Debug mode off"
fi

echo "Something = $something"
```
