#!/bin/bash

# Script to configure Tomcat manager credentials
# Run this on your Tomcat server

set -e

echo "=== Tomcat Manager Configuration Script ==="
echo ""

# Find Tomcat installation
TOMCAT_PATHS=(
    "/opt/tomcat"
    "/usr/share/tomcat"
    "/usr/local/tomcat"
    "/var/lib/tomcat"
    "/opt/tomcat9"
    "/opt/tomcat10"
)

TOMCAT_HOME=""
for path in "${TOMCAT_PATHS[@]}"; do
    if [ -d "$path/conf" ]; then
        TOMCAT_HOME="$path"
        echo "✓ Found Tomcat at: $TOMCAT_HOME"
        break
    fi
done

if [ -z "$TOMCAT_HOME" ]; then
    echo "❌ Error: Could not find Tomcat installation"
    echo "Please specify manually: export TOMCAT_HOME=/path/to/tomcat"
    exit 1
fi

TOMCAT_USERS_FILE="$TOMCAT_HOME/conf/tomcat-users.xml"

# Backup existing file
if [ -f "$TOMCAT_USERS_FILE" ]; then
    echo "✓ Backing up existing tomcat-users.xml"
    sudo cp "$TOMCAT_USERS_FILE" "$TOMCAT_USERS_FILE.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Create tomcat-users.xml with manager credentials
echo "✓ Creating tomcat-users.xml with manager-script role"
sudo tee "$TOMCAT_USERS_FILE" > /dev/null <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">
  
  <!-- Roles required for manager access -->
  <role rolename="manager-gui"/>
  <role rolename="manager-script"/>
  <role rolename="manager-jmx"/>
  <role rolename="manager-status"/>
  
  <!-- User for Jenkins deployment -->
  <user username="tomcat" password="Raghu@123" roles="manager-gui,manager-script"/>
  
</tomcat-users>
EOF

# Set proper permissions
sudo chmod 600 "$TOMCAT_USERS_FILE"
sudo chown tomcat:tomcat "$TOMCAT_USERS_FILE" 2>/dev/null || true

echo "✓ Configuration complete"
echo ""
echo "=== Next Steps ==="
echo "1. Restart Tomcat:"
echo "   sudo systemctl restart tomcat"
echo "   OR"
echo "   sudo service tomcat restart"
echo ""
echo "2. Verify Jenkins credentials:"
echo "   Username: tomcat"
echo "   Password: Raghu@123"
echo ""
echo "3. Test manager access:"
echo "   curl -u tomcat:Raghu@123 http://localhost:8080/manager/text/list"
echo ""
