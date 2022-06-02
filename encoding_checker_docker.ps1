[CmdletBinding()] 
Param (
    [Parameter(Mandatory = $False)] [string[]] $ProjectName,
    [Parameter(Mandatory = $False)] [string[]] $IncludePath,
    [Parameter(Mandatory = $False)] [string[]] $ExcludePath
    [Parameter(Mandatory = $False)] [string[]] $ExcludeExt,
    [Parameter(Mandatory = $False)] [string[]] $IncludeExt,
)

(Get-Content DockerfileTemplate).replace('#PROJECT_NAME', $ProjectName) | Set-Content Dockerfile
(Get-Content DockerfileTemplate).replace('#INCLUDE_PATH', $IncludePath) | Set-Content Dockerfile
(Get-Content DockerfileTemplate).replace('#EXCLUDE_PATH', $ExcludePath) | Set-Content Dockerfile
(Get-Content DockerfileTemplate).replace('#EXCLUDE_EXT', $ExcludeExt) | Set-Content Dockerfile
(Get-Content DockerfileTemplate).replace('#EXCLUDE_EXT', $ExcludeExt) | Set-Content Dockerfile

cls

# Remove container and image
docker rm encoding_checker

docker image rm encoding_checker:latest

# Build Image
#docker build -t encoding_checker:latest .

# Start Container
#docker run -v .:/root/encoding_checker encoding_checker

# .\script.ps1 -ProjectName NucleoDuro -IncludePath /NucleoDuro/NucleoDuro/NucleoDuro/wwwroot -IncludeExt css
# .\script.ps1 -ProjectName NucleoDuro -ExcludePath /NucleoDuro/NucleoDuro/NucleoDuro/wwwroot -ExcludeExt sln 