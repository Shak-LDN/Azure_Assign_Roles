param(
    [string]$ImportCsv
)

$AllUsers = Import-Csv -Path $ImportCsv
$AllUsers | ForEach-Object {

    $Username = $_.Username
    $RoleDefinitionName = $_.RoleDefinitionName
    $ResourceGroupName = $_.ResourceGroupName

    Write-Host "Processing user: $Username"
    Write-Host "Role: $RoleDefinitionName"
    Write-Host "Resource Group: $ResourceGroupName"

    try {
        New-AzRoleAssignment -SignInName $Username -RoleDefinitionName $RoleDefinitionName -ResourceGroupName $ResourceGroupName -Verbose
        Write-Host "Role assigned sucessfully for user: $Username"
    } catch {
        Write-Host "Error assinging role for user: $Username"
        Write-Host "Error message: $_"
     }
    }
