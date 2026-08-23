
# Off-Site Backup Storage

## Purpose

Off-site storage protects backup copies from failures affecting the primary infrastructure.

## Recommended Architecture

```text
Production System
       |
       v
Primary Backup
       |
       +------> Local Storage
       |
       +------> Off-Site Storage
       |
       +------> Cloud Storage
