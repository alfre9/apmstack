# Sourced by each case's fixture.sh: copies the sample PM home into the run's workspace.
repo="$(cd "$(dirname "$0")/../.." && pwd)"
cp -R "$repo/examples/apmstack" ./apmstack
echo "$PWD/apmstack" > "$HOME/.apmstack"
today=$(date +%F)
mkdir -p apmstack/notes
