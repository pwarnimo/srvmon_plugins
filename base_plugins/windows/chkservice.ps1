#!/bin/bash
#
# Script      : chkservice.ps1
# Author(s)   : Pol Warnimont
# Create date : 2015-07-03
# Version     : 1.0 R1
#
# Description : A check script for SRVMON - Check service status.
#
# Changelog
# ---------
#  2015-07-03 : Created script.
#
# License
# -------
#  Copyright (C) 2015  Pol Warnimont
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Affero General Public License as
#  published by the Free Software Foundation, either version 3 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
#
#  You should have received a copy of the GNU Affero General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

if ($args.Count -eq 1) {
    $proc = Get-Process $args[0] -ErrorAction SilentlyContinue

    if ($proc -ne $null) {
        $output = $args[0] + " service is running."
        $excode = 0
    }
    else {
        $output = $args[0] + " service is stopped!"
        $excode = 2
    }

    Write-Host "$excode;$output"
}
else {
    Write-Host "Syntax error!"
    Write-Host "Usage: chkservice.ps1 <service name>"
    Write-Host "Ex.  : chkservice.ps1 openvpn"
    Write-Host ""
    Write-Host "Copyright (C) 2015  Pol Warnimont"
    Write-Host "This script (chkservice.ps1) comes with ABSOLUTELY NO WARRANTY!"
    
    $excode = 0
}

exit $excode