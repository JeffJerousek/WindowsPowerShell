$choice = ""
while ($choice -notmatch "[y|n]"){
    $choice = read-host "Do you want to continue? (Y/N)"
    }

if ($choice -eq "y")
{
    
# Your script here!

}
    
else {write-host "You aborted the export!"}