param (
    [int]$TotalCount = 50
)

function My-LongRunningTask {
    param (
        [int]$Total
    )

    for ($i = 1; $i -le $Total; $i++) {
        Write-Progress -PercentComplete (($i / $Total) * 100) -Activity "Processing" -Status "Item $i/$Total"
        Start-Sleep -Seconds 1
    }
}

My-LongRunningTask -Total $TotalCount -ProgressAction {
    param ($ProgressRecord)
    Write-Host "Progress: $($ProgressRecord.PercentComplete)% - $($ProgressRecord.Status)"
}

Write-Host "Task completed."