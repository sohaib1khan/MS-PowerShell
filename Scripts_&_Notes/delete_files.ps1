# Define the variable list
$items = @("item1", "item2", "item3")

# Loop through each item in the list
foreach ($item in $items) {
    # Construct the path using the current item
    $path = "\\path\to\delete\$item\do-not-del\DELETE-FILES"
    
    # Remove the item at the specified path
    try {
        Remove-Item -Path $path -Force -Recurse
        Write-Host "Successfully deleted: $path"
    } catch {
        Write-Host "Failed to delete: $path"
        Write-Host $_.Exception.Message
    }
}