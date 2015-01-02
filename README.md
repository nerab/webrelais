# Webrelais

This is a simple web interface for controlling a HL-58S relais card via a Raspberry Pi.

## Usage

1. Connect the pins of the relais card to the Rapis's GPIO ports 0..7
1. `git clone` this project or install the gem (see below)
1. Start the web server with

        $ foreman start

## Installation

1. Install [WiringPi](http://wiringpi.com/) for the `gpio` command.
1. Install this gem:

        $ gem install webrelais
