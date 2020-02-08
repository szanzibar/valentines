function Get-ValentinesGreeting {
  $heart = @"
       .;oOKNWWWNKOo,.           .,oOKNWWWNKOo;.       
     ,ok0OkxdooodxkO0kl'       'lk0OkxdooodxkO0ko,     
  .;kKOoc;,,,,,',,,;cdOKx;   ;xKOdc;,,,,',,,,;coOKk;   
 .xKOc;,,,,,,,,,,,,,',;lOKxlxKOl;,,,,,,,,,,,,,,,,cOKd. 
'kXd;,,,,,,,,,,,,,,,,,,,:xXWXx;,,,,,,,,,,,,,,,,,,,;dKk'
xXd;,,,,,,,,,,,,,,,,,,,,,;oxo;',,,,,,,,,,,,,,,,,,,,;xXx
X0:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,c0X
Wk;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;kW
Nk;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:ON
K0c,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,cKK
dXd;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;xXd
'OKo,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;dXk.
 ,0Ko;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;xKk' 
  'kKx:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,lOKo.  
   .c00d:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,cxKk;    
     .o00o:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,cxKOc.     
       'o00d:,,,,,,,,,,,,,,,,,,,,,,,,,,,,;lkKOc.       
         .lO0xc,,,,',,,,,,,,,,,,,,,,,,,;oOKk:.         
           .ckKkl;,,,,,,,,,,,,,,,,,,,:d00d,            
             .;xKOo;,,,,,,,,,,,,,,,:d00o'              
                ,d00o:,,,,,,,,,,,:x0Ol.                
                  'o00o;,,,,,,,:d0Ol.                  
                    'dK0o;,,,;o00l.                    
                      ,xKkc;lOKd'                      
                       .c0XKX0:                        
                         ;KMK;                         
"@

  $styledMessage = @"
    __  __                                          
   / / / /___ _____  ____  __  __                   
  / /_/ / __ '/ __ \/ __ \/ / / /                   
 / __  / /_/ / /_/ / /_/ / /_/ /                    
/_/ /_/\__,_/ .___/ .___/\__, /                     
 _    __   /_/__ /_/    /____/ _           _        
| |  / /___ _/ /__  ____  / /_(_)___  ___ ( )_____  
| | / / __ '/ / _ \/ __ \/ __/ / __ \/ _ \|// ___/  
| |/ / /_/ / /  __/ / / / /_/ / / / /  __/ (__  )   
|___////,_/_/\___/_/ /_/\__/_/_/ /_/\___/ /____/    
   / __ \____ ___  __                               
  / / / / __ '/ / / /                               
 / /_/ / /_/ / /_/ /                                
/_____/\__,_/\__, /                                 
    ____   _/____/                                __
   /  _/  / /___ _   _____     __  ______  __  __/ /
   / /   / / __ \ | / / _ \   / / / / __ \/ / / / / 
 _/ /   / / /_/ / |/ /  __/  / /_/ / /_/ / /_/ /_/  
/___/  /_/\____/|___/\___/   \__, /\____/\__,_(_)   
                            /____/                  
"@

  $greetingList = `
    "You really make my hard drives whir.", `
    "You have hacked my heart.", `
    "My code always compiles when I'm with you.", `
    "I like you more than a new All Flash Nimble Array.", `
    "I want to share my private encryption key with you.", `
    "Let's open a joint cryptocurrency wallet."

  $randomGreeting = "Romantic Valentine's Greeting: $($greetingList | Get-Random)"

  $to = "To: $env:USERNAME"
  $from = "From: Steven"

  $inBetweenDelay = 500

  Clear-Host
  Write-WithDelay $heart
  Start-Sleep -Milliseconds $inBetweenDelay
  Write-WithDelay $to
  Start-Sleep -Milliseconds $inBetweenDelay
  Write-WithDelay $from
  Start-Sleep -Milliseconds $inBetweenDelay
  Write-WithDelay $randomGreeting
  Start-Sleep -Milliseconds $inBetweenDelay
  Write-WithDelay $styledMessage

}

function Write-WithDelay {
  Param(
    [Parameter(Mandatory = $true,
      ValueFromPipeline = $true)]
    [String[]]
    $multiLineString
  )

  $split = $multiLineString -split "`r`n"
  if ($split.Length -eq 1) {
    $split = $multiLineString -split "`n"
  }

  $delayBetweenLines = 200

  ForEach ($line in $split) {
    Start-Sleep -Milliseconds $delayBetweenLines
    Write-Output $line
  }
  Start-Sleep -Milliseconds $delayBetweenLines
  Write-Output ""
}

Write-Output "Get-ValentinesGreeting`n"
Get-ValentinesGreeting