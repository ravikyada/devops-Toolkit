
# OpenVPN3 Commands

## Importing Configuration
Import a configuration file and create a persistent profile.
```sh
openvpn3 config-import --config client.ovpn --name <profile_name> --persistent
```

## Listing Configurations
List all imported configurations.
```sh
openvpn3 configs-list
```

## Listing Sessions
List all active VPN sessions.
```sh
openvpn3 sessions-list
```

## Starting a Session
Start a VPN session using a specific profile name.
```sh
openvpn3 session-start --config <profile_name>
```

Start a VPN session directly from a configuration file.
```sh
openvpn3 session-start --config client.ovpn
```

## Additional Commands

### Stopping a Session
Stop a running VPN session using the session ID.
```sh
openvpn3 session-manage --session-id <session_id> --disconnect
```

### Showing Session Details
Show detailed information about a specific session using the session ID.
```sh
openvpn3 session-manage --session-id <session_id> --show
```

### Removing a Configuration
Remove an imported configuration by name.
```sh
openvpn3 config-remove --name <profile_name>
```

### Checking the Status of a Session
Check the status of a specific VPN session using the session ID.
```sh
openvpn3 session-manage --session-id <session_id> --status
```

### Viewing Logs
View logs for a specific session using the session ID.
```sh
openvpn3 session-manage --session-id <session_id> --log
```