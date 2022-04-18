# SUB/ZUB

Resurrection of an 8-bit classic!
Currently a work in progress

A PICO-8 game based on [this Amstrad game](https://www.cpcwiki.eu/index.php/ZUB)

## Debugging

Theres a debug.lua file that contains debug code and can be included in the p8 file if you need it.
By not including it you can save tokens

### Functions:

`Debug.log` String - output string, Bool weather to wipe the file
Outputs to log.txt (you must set the global logfile somewhere). You can follow this file in a terminal with `tail -f log.txt`
