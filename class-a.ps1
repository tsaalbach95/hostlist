New-Item -ItemType Directory -Force -Path C:\class\

$LogFile = "C:\class\class-a.txt"  

$ipadd = "10."
### RUN IP-CHECK FROM 1to20 and 250to255 in the 10.0.0.0/8 SUBNET ###
if ( 10. -eq $ipadd ) {    

    foreach ($ipadd2 in 0..255) {
        foreach ($subnet in 0..255) { 
            function PingRange([string[]]$iprange) {
                foreach ($ip in $iprange) {
                    "$ip" | out-file $LogFile -Append -Encoding ASCII        
                }
            }
            PingRange (1..20 | % { "$ipadd" + "$ipadd2." + "$subnet." + $_ })

            function PingRange([string[]]$iprange) {
                foreach ($ip in $iprange) {
                    "$ip" | out-file $LogFile -Append -Encoding ASCII             
                }
            }    
            PingRange (250..255 | % { "$ipadd" + "$ipadd2." + "$subnet." + $_ })
        }
    }
}