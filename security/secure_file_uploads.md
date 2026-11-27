
# Secure File Uploads

## Introduction
File upload functionality can introduce security risks if uploaded files are not properly validated and stored.

## Common Risks

- Malicious files.
- Malware uploads.
- Path traversal.
- Executable file uploads.
- Storage exhaustion.
- File content spoofing.

## Security Measures

### 1. Validate File Types
Use allowlists of accepted file types.

### 2. Validate File Size
Set maximum upload size limits.

### 3. Verify File Content
Do not rely only on file extensions or client-provided MIME types.

### 4. Rename Uploaded Files
Generate unique filenames instead of trusting user-provided filenames.

### 5. Store Files Safely
Store uploaded files outside publicly executable directories where possible.

### 6. Restrict Permissions
Apply minimal filesystem permissions.

### 7. Scan Files
Use malware scanning where appropriate.

## Example Validation Logic

```text
1. Receive uploaded file.
2. Check file size.
3. Validate allowed extension.
4. Verify content type and file signature where appropriate.
5. Generate safe filename.
6. Store in restricted location.
7. Log upload activity.
