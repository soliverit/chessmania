# Chessmani
## What is it?
A chess plugin for Trackmania that uses the Stockfish chess engine as the AI player.

It's just a project to learn the basics of angelscript. Fairly hack and slash. Still haven't figured out type casting...
## Setup
### Openplanet and plugin
1) Install OpenPlanet: Pretty sure it needs community mode, maybe standard
2) F3 in game to bring up the Openplanet menu
3) In file select open folder.
4) Clone the repo to the Plugins folder

### Chess server
1) Install python 3
2) Run `pip install flask` to install the server in cmd.exe
3) If that doesn't work "is not recognised" `cd c:/<path-to-python>/scripts` then run `pip install flask`
4) Download stockfinsh: Either place the exe in `./stockfish/` or change line 8 of './server.py`
5) Change to the plugin's directory
6) Run `python server.py`
