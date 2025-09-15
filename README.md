# Shutdown Timer - Windows Batch Script

A simple Windows batch script that lets you schedule your PC to shut down after a set amount of time, with a clean, color-coded menu and easy cancel option.

## Features

- Set a shutdown timer in minutes or hours/minutes (e.g., 1h30m, 2h, 45)  
- Overwrites any previous shutdown timer automatically  
- Cancel a scheduled shutdown anytime  
- Color-coded, stylized menu for easy readability  
- Works entirely in a batch script, no installation needed  

## Installation

1. Download `ShutdownTimer.bat`  
2. Double-click to run the script  
3. Choose options from the menu to set or cancel shutdown timers  

## Usage

1. Press `[1]` to set a shutdown timer  
2. Enter your time in one of these formats:  
   - `1h30m` → 1 hour 30 minutes  
   - `2h` → 2 hours  
   - `45` → 45 minutes  
3. Press `[2]` to cancel any active shutdown timer  
4. Press `[3]` to exit the script  

**Notes:**  
- Plain numbers default to minutes  
- The script displays a stylized header and color-coded messages for clarity  

## Uninstallation

No installation is required. To remove the script:  
1. Cancel any active timers using `[2]`  
2. Delete the `ShutdownTimer.bat` file  

## Requirements

- Windows operating system  
- No admin rights needed  
- Runs entirely in a command prompt / batch environment  

## How it Works

- Schedules shutdown using Windows `shutdown -s -t <seconds>` command  
- Cancels previous timers with `shutdown -a` before setting a new one  
- Parses user input for hours (`h`) and minutes (`m`) or plain minutes  
- Provides color-coded feedback for errors and confirmations  

##### ~-~-~-~-~-~-~-~-~-~bewf on top~-~-~-~-~-~-~-~-~-~
