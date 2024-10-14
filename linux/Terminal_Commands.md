
# Common Most Useful Terminal Commands

## User Information
Show the current logged-in user.
```bash
whoami
```
Show the User details.
```bash
finger <username>
```

## Date and Time
Display the current date and time.
```bash
date
```

## File System Navigation
| Command                             | Description                                        |
| ----------------------------------- | -------------------------------------------------- |
| pwd                                 | Print working directory                            |
| ls                                  | List directory contents                            |
| ls -a                               | List all contents including hidden files           |
| ls -l                               | List contents with detailed information            |
| cd                                  | Change to home directory                           |
| cd [dirname]                        | Change to specific directory                       |
| cd ..                               | Change to parent directory                         |
| find [dirtosearch] -name [filename] | Find a file or directory                           |

## Opening Files or Folders
Open files or directories in GUI.
- Mac: `open [dirname]`
- Windows: `start [dirname]`
- Linux: `xdg-open [dirname]`

## Modifying Files & Directories
| Command                     | Description                             |
| --------------------------- | --------------------------------------- |
| mkdir [dirname]             | Make directory                          |
| touch [filename]            | Create file                             |
| rm [filename]               | Remove file                             |
| rm -r [dirname]             | Remove directory                        |
| cp [filename] [dirname]     | Copy file                               |
| mv [filename] [dirname]     | Move file                               |
| mv [filename] [filename]    | Rename file or directory                |

## Output Redirection
Create a new file with output.
```bash
> [filename]
```

## Concatenate Files
View, create, or append files.
```bash
cat [filename]
cat > [filename]
cat >> [filename]
```

## Viewing Files
View file contents with scrolling.
```bash
less [filename]
```
Exit with `q`.

## Display Text
Display messages or create/write files.
```bash
echo "Hello World"
echo "Hello World" > [filename]
echo "Hello World" >> [filename]
```

## Text Editor
Edit files with Nano.
```bash
nano [filename]
```
Exit with `Ctrl + X`, then `Y` to save or `N` to discard.

## Head and Tail
Display the beginning or end of files.
```bash
head [filename]
head -n 5 [filename]
tail [filename]
tail -n 5 [filename]
```

## Search Text
Search for patterns in files.
```bash
grep [searchterm] [filename]
```

## Find Files
Locate files and directories.
```bash
find [dirname] -name [filename]
find . -empty
find . -name "file-*" -delete
```

## Piping
Redirect output to another command or file.
```bash
find . -name "file-0*" > output.txt
```

## Symlinks
Create shortcuts to files or directories.
```bash
ln -s [filename] [symlinkname]
rm [symlinkname]
```
For Windows:
```bash
mklink [symlinkname] [filename]
```

## File Compression
Compress or extract files with tar.
| Command                             | Description                |
| ----------------------------------- | -------------------------- |
| tar czvf [dirname].tar.gz [dirname] | Create tarball             |
| tar tzvf [dirname]                  | See contents of tarball    |
| tar xzvf [dirname].tar.gz           | Extract tarball            |

## Networking Commands
| Command                     | Description                             |
| --------------------------- | --------------------------------------- |
| ifconfig                    | Display network configuration           |
| ip addr show                | Display IP addresses and network interfaces |
| ping [hostname]             | Check connectivity to a host            |
| traceroute [hostname]       | Trace the route packets take to a network host |
| nslookup [hostname]         | Query the DNS for information about a domain |
| dig [domain]                | Detailed DNS query                      |
| netstat                     | Network statistics                      |
| curl [url]                  | Transfer data from or to a server       |
| wget [url]                  | Download files from the web             |

## System Monitoring
| Command                     | Description                             |
| --------------------------- | --------------------------------------- |
| top                         | Display active processes                |
| htop                        | Interactive process viewer              |
| ps                          | Display information about active processes |
| df                          | Report file system disk space usage     |
| du                          | Estimate file space usage               |
| free                        | Display memory usage                    |
| uname -a                    | Display system information              |

## Disk Usage
| Command                     | Description                             |
| --------------------------- | --------------------------------------- |
| df -h                       | Show disk usage in human-readable format |
| du -sh [dirname]            | Show disk usage for a directory         |
| du -shl *                   | Show disk usage for all items in a directory |

## Package Management (Linux)
| Command                     | Description                             |
| --------------------------- | --------------------------------------- |
| apt-get update              | Update package lists (Debian/Ubuntu)    |
| apt-get upgrade             | Upgrade installed packages (Debian/Ubuntu) |
| yum update                  | Update packages (RedHat/CentOS)         |
| yum upgrade                 | Upgrade packages (RedHat/CentOS)        |

## System Information
| Command                     | Description                             |
| --------------------------- | --------------------------------------- |
| uname -r                    | Show kernel version                     |
| lsb_release -a              | Show Linux distribution information     |
| hostnamectl                 | Query and change the system hostname    |

## Permissions
| Command                     | Description                             |
| --------------------------- | --------------------------------------- |
| chmod [options] [filename]  | Change file mode (permissions)          |
| chown [owner]:[group] [file]| Change file owner and group             |
| sudo [command]              | Execute a command as another user       |
| getfacl <filename>          | Easy Permission Read(File Access Control)|