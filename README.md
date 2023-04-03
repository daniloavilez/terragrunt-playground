# Hack to Windows OS

Export environment variable `TERRAGRUNT_DOWNLOAD` solve the problem of [Maximum Path Length Limitation](https://learn.microsoft.com/en-us/windows/win32/fileio/naming-a-file#maximum-path-length-limitation)

`export TERRAGRUNT_DOWNLOAD=/c/.terragrunt-cache`

Or use WSL 2 ;P