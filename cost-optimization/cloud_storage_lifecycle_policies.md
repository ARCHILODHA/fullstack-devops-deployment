# Cloud Storage Lifecycle Policies

## Overview
Storage lifecycle policies automatically manage data as it ages.

In AWS S3, lifecycle rules can transition objects to lower-cost storage classes or delete objects after a defined period.

## Why Lifecycle Policies Matter
- Reduce long-term storage costs.
- Automate data management.
- Remove unnecessary old data.
- Improve storage governance.

## Common S3 Storage Classes
- S3 Standard
- S3 Intelligent-Tiering
- S3 Standard-IA
- S3 One Zone-IA
- S3 Glacier Instant Retrieval
- S3 Glacier Flexible Retrieval
- S3 Glacier Deep Archive

## Lifecycle Policy Actions

### 1. Transition Actions
Move objects to another storage class after a specified period.

Example:
- Day 0: S3 Standard
- Day 30: S3 Standard-IA
- Day 90: S3 Glacier Flexible Retrieval

The transitions must comply with the storage class minimum-duration and eligibility requirements.

### 2. Expiration Actions
Automatically delete objects after a defined retention period.

### 3. Incomplete Multipart Upload Cleanup
Abort incomplete multipart uploads after a specified number of days.

## Example Lifecycle Configuration

```json
{
  "Rules": [
    {
      "ID": "ArchiveOldLogs",
      "Status": "Enabled",
      "Filter": {
        "Prefix": "logs/"
      },
      "Transitions": [
        {
          "Days": 30,
          "StorageClass": "STANDARD_IA"
        },
        {
          "Days": 90,
          "StorageClass": "GLACIER"
        }
      ],
      "Expiration": {
        "Days": 365
      },
      "AbortIncompleteMultipartUpload": {
        "DaysAfterInitiation": 7
      }
    }
  ]
}
