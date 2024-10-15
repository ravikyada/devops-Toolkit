
# SSH Without Prompting for Password

Configure SSH to avoid prompting for a password each time.

## Problem Statement

Currently, after setting up SSH with a PEM file, you can access a server without a password like so:

```bash
ssh -i "ohio.pem" ubuntu@ec2-X.x.X.X.us-east-2.compute.amazonaws.com
```

However, when a user is created on the remote server with a password (e.g., user `devops`), SSH prompts for a password every time you log in:

```bash
ssh devops@3.xx.xx.xx
EnterPassword:
```

We need to configure the local machine to stop asking for the password each time without changing anything on the remote server.

## Configuration Steps

### 1. Edit SSH Config File

Create or edit the SSH configuration file located at `~/.ssh/config`:

```bash
nano ~/.ssh/config
```

Add the following configuration:

```plaintext
Host 3.xx.xx.xx
    HostName 3.xx.xx.xx
    User ubuntu
    PreferredAuthentications password
    IdentityFile none
```

### 2. Identify Your Shell

Check your current shell with:

```bash
echo $SHELL
```

Depending on the shell, configuration files differ:

- **Bash:** `~/.bashrc`
- **Zsh:** `~/.zshrc`
- **Fish:** `~/.config/fish/config.fish`

### 3. Configure Shell Alias

Since the shell in use is Zsh, configure the `.zshrc` file:

```bash
nano ~/.zshrc
```

Add the following alias at the end of the file:

```bash
# ssc command alias
alias ssc='sshpass -p123 ssh'
```

> **Note:** Replace `123` with the actual password of user `devops`.

### 4. Reload Shell Configuration

Reload the shell configuration:

```bash
source ~/.zshrc
```

### 5. Test SSH Connection

Test the SSH connection with the alias:

```bash
ssc 3.xx.xx.xx   # First time, it asks for the password.
```

Exit and log in again:

```bash
ssc 3.xx.xx.xx   # This time, login without prompt.
```

## Additional Notes

- **known_hosts**: Located at `~/.ssh/known_hosts`, this file contains public keys of remote servers used to verify their identity during connections.
- **Config File**: The SSH configuration file (`~/.ssh/config`) allows customization of connection settings for various hosts.

By following these steps, you can ensure that SSH connections do not prompt for passwords repeatedly while maintaining existing remote server configurations.