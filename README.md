# press

Automate pressing a key using powershell.

## Setup

1. Copy the contents of the file in this repository called [`press.ps1`](press.ps1) to your clipboard.
1. Open powershell.
1. Run `notepad $PROFILE`.
1. At the bottom of the file that opened paste what you copied in step 1.
1. Save that file and close it.
1. Close powershell.
1. To check that setup worked open a new powershell (you must close and reopen powershell in order for that profile that we edited to get run) and run `Get-Help press -Detailed`. You should see help information.

## Usage

1. Open powershell.
1. Run `press`.
1. Minimize powershell and go on with your day.
1. When finished, hold `ctrl` and press `c` (`ctrl+c`).

### Custom Usage

Any key can be pressed at any interval. For example `press a 5` will press the "a" key every 5 seconds.

## How to Get Help Information.

1. Open powershell.
1. Run `Get-Help press -Detailed`.
