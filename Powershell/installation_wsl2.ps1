## Remember to change drive letter ##

$folder='G:\WSL\'
$url='https://aka.ms/wslubuntu2004'
$file='Ubuntu.appx'

## Habilitar Powershell scripts ##
Set-ExecutionPolicy Unrestricted

if (Test-Path -Path $folder){
    "Path Exists - Installing"
    cd $folder
    cd .\Ubuntu\
    ls
    .\ubuntu2004.exe
    
} else {
    "Creando carpeta"
    mkdir $folder
    cd $folder
    Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing
    
    if (Test-Path -Path ($folder+$file) -PathType Leaf ) {
        "Mover archivo"
        ls
        move .\$file .\Ubuntu.zip
        Expand-Archive .\Ubuntu.zip
        cd .\Ubuntu\
        ls
        .\ubuntu2004.exe

    } else {
        "Fin"
    }
    
}
