
# Blue-Green Deployment

## Overview
Blue-Green Deployment is a deployment strategy that maintains two separate environments: Blue and Green.

One environment serves live production traffic while the other is used to deploy and test a new application version.

## How It Works

### Step 1: Blue Environment
The Blue environment runs the current stable application version and handles production traffic.

### Step 2: Green Environment
The new application version is deployed to the Green environment.

### Step 3: Testing
The Green environment is tested using health checks and functional tests.

### Step 4: Traffic Switching
Traffic is redirected from Blue to Green using a load balancer or routing mechanism.

### Step 5: Rollback
If the new version fails, traffic can be switched back to Blue, provided the previous environment remains compatible.

## Architecture

```text
                 Users
                   |
              Load Balancer
                   |
          ---------------------
          |                   |
     Blue Environment   Green Environment
      Stable Version      New Version
          |                   |
       Production          Testing
