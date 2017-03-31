# Bash options

aka arguments, switches

```bash
debug=0

while [ "$1" != "" ]; do
	case $1 in
		--something) shift; something=$1;;
		--debug ) debug=1;;
		*) echo "unknown argument" >&2; exit 1;;
    esac
    shift
done

if [ "$debug" = "1" ]; then
	echo "Debug mode on"
else
	echo "Debug mode off"
fi
echo "Something = $something"
```

Invoke: `script.sh --something xxx --debug`
