function press {
    <#
        .SYNOPSIS
        Press a key while repeatedly at a given interval on the current active application.

        .DESCRIPTION
        Press the specified repeatedly at the specified interval. Quit out of the repetition by pressing ctrl+c.

        .PARAMETER key
        The key to press repeatedly. Defaults to the f15 key ("F15").

        .PARAMETER interval
        The interval (in seconds) to wait before pressing the key again. Defaults to 300 seconds or 5 minutes.

        .PARAMETER message
        Should a message be downloaded and printed to the screen before starting key presses? Any number besides 0 enables this. Default is 1 (enabled).

        .EXAMPLE
        PS> press

        .EXAMPLE
        PS> press F15

        .EXAMPLE
        PS> press F15 300

        .EXAMPLE
        PS> press -key F15 -interval 300

        .EXAMPLE
        PS> press -message 0
    #>
    param (
        [Parameter()][string] $key = "F15",
        [Parameter()][int] $interval = 300,
        [Parameter()][int] $message = 1
    )

    if ($message -ne 0) {
        try {
            $result = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/RWeThereYet17/press/main/message.txt"
            Write-Output $result.Content
        }
        catch {
            Write-Output "Couldn't download message."
        }
    }
    
    Write-Output "Press ctrl+c to quit."
    $times = 0
    $wshell = New-Object -ComObject wscript.shell;
    $start_time = Get-Date

    try {
        while ($true) {
            $wshell.SendKeys("{$key}")
            $times++
            Start-Sleep -Seconds $interval
        }
    }
    finally {
        $end_time = Get-Date
        $elapsed = $end_time - $start_time

        if ($times -gt 1) {
            $plural = "s"
        } else {
            $plural = ""
        }

        Write-Host "Key was pressed $times time$plural. Ran for $elapsed."
    }
}
