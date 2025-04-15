# taipme

Anti-social network

## Testing the App on Android and iOS

### Android Emulator
- Use the following URL for API requests:

http://10.0.2.2:8081/WhitePaper/mobile/faq

- **Why?**: `10.0.2.2` is a special alias that allows the Android emulator to access the host machine's `localhost`.

### iOS Emulator
- Use the following URL for API requests:

http://localhost:8081/WhitePaper/mobile/faq

- **Why?**: The iOS emulator can directly access the host machine's `localhost`.

### Physical Devices (Android or iOS)
- Use your machine's local network IP address for API requests. For example:

http://192.168.x.x:8081/WhitePaper/mobile/faq

Replace `192.168.x.x` with your machine's actual IP address.
- **How to Find Your IP Address**:
- On macOS: Open `System Preferences` > `Network` and check the IP address of your active network connection.
- On Windows: Run `ipconfig` in the terminal and look for the IPv4 address of your active network connection.

### Notes
- Ensure your development machine and the physical device are connected to the same network.
- If you encounter issues, check your backend server's firewall or network settings to ensure it allows connections from your device.