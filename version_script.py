#!/usr/bin/env python3
import os
import re
import sys
import subprocess

def read_current_version(pubspec_path):
    with open(pubspec_path, 'r') as file:
        content = file.read()
        version_match = re.search(r'version: ([\d.]+)\+(\d+)', content)
        if version_match:
            return version_match.group(1), version_match.group(2)
    raise ValueError("Could not find version in pubspec.yaml")

def increment_version(current_version, current_build, increment_type='build'):
    if increment_type == 'feature':
        # Split version into major.minor.patch
        parts = current_version.split('.')
        # Increment minor version, reset patch
        parts[1] = str(int(parts[1]) + 1)
        parts[2] = '0'
        return '.'.join(parts), '0'
    else:
        # Increment build number
        return current_version, str(int(current_build) + 1)

def update_pubspec(pubspec_path, new_version, new_build):
    full_version = f"{new_version}+{new_build}"
    
    # Read the current content
    with open(pubspec_path, 'r') as file:
        content = file.read()
    
    # Replace the version
    updated_content = re.sub(
        r'version: [\d.]+\+\d+', 
        f'version: {full_version}', 
        content
    )
    
    # Write back to the file
    with open(pubspec_path, 'w') as file:
        file.write(updated_content)
    
    return full_version

def main():
    # Path to pubspec.yaml
    pubspec_path = 'pubspec.yaml'
    
    # Determine increment type
    increment_type = sys.argv[1] if len(sys.argv) > 1 else 'build'
    
    try:
        # Read current version
        current_version, current_build = read_current_version(pubspec_path)
        
        # Increment version
        new_version, new_build = increment_version(
            current_version, 
            current_build, 
            increment_type
        )
        
        # Update pubspec.yaml
        full_version = update_pubspec(pubspec_path, new_version, new_build)
        
        # Git operations
        subprocess.run(['git', 'config', '--local', 'user.email', 'action@github.com'], check=True)
        subprocess.run(['git', 'config', '--local', 'user.name', 'GitHub Action'], check=True)
        subprocess.run(['git', 'add', pubspec_path], check=True)
        subprocess.run(['git', 'commit', '-m', f'chore: bump version to {full_version}'], check=True)
        subprocess.run(['git', 'tag', f'v{full_version}'], check=True)
        
        print(f"Version updated to {full_version}")
        
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == '__main__':
    main()