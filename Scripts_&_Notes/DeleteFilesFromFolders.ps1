# Define the path to the inventory file
$inventoryFilePath = "C:\path\to\your\inventory.txt"

# Define the base path to the target folders
$basePath = "C:\SOME\PATH\TARGET_FOLDER"

# Check if the inventory file exists
if (-Not (Test-Path -Path $inventoryFilePath)) {
    Write-Output "Inventory file not found at $inventoryFilePath"
    exit
}

# Read the inventory file to get the list of folder names
$folders = Get-Content -Path $inventoryFilePath

# Loop through each folder name in the inventory
foreach ($folder in $folders) {
    # Construct the full path to the target folder
    $targetFolderPath = Join-Path -Path $basePath -ChildPath $folder

    # Check if the target folder exists
    if (Test-Path -Path $targetFolderPath) {
        # Get all files in the target folder
        $files = Get-ChildItem -Path $targetFolderPath -File

        # Loop through and delete each file
        foreach ($file in $files) {
            try {
                Remove-Item -Path $file.FullName -Force
                Write-Output "Deleted file: $($file.FullName)"
            } catch {
                Write-Output "Failed to delete file: $($file.FullName). Error: $_"
            }
        }
    } else {
        Write-Output "Folder not found: $targetFolderPath"
    }
}

Write-Output "Script execution completed."
