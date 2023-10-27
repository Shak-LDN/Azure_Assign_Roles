param(
    [string]$ImportCsv
)

$AllGroups = Import-Csv -Path $ImportCsv
$AllGroups | ForEach-Object {

    $ObjectId = $_.ObjectId
    $RoleDefinitionName = $_.RoleDefinitionName
    $ResourceGroupName = $_.ResourceGroupName

    Write-Host "Processing group: $ObjectId"
    Write-Host "Role: $RoleDefinitionName"
    Write-Host "Resource Group: $ResourceGroupName"

    try {
        New-AzRoleAssignment -ObjectId $ObjectId -RoleDefinitionName $RoleDefinitionName -ResourceGroupName $ResourceGroupName -Verbose
        Write-Host "Role assigned sucessfully for group: $ObjectId"
    } catch {
        Write-Host "Error assinging role for group: $ObjectId"
        Write-Host "Error message: $_"
     }
    }
