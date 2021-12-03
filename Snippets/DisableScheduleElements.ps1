# Localhost is the name of the JAMS Server or this script must be run on the Scheduler
Import-module JAMS
New-PSDrive JD JAMS Localhost
$jobs = Get-ChildItem JD:\ -Recurse -IgnorePredefined -FullObject

foreach ($job in $jobs){
    foreach($element in $job.Elements){
# Target only the ScheduleTrigger element type
       if($element.ElementName -eq "" -and $element.ElementTypeName -eq "ScheduleTrigger"){
         $element.Enabled = $False
         $job.Name
        }
         $job.Update()
    }
}
