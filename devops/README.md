# Tomcat Deployment Configuration

## Fix 401 Unauthorized Error

If Jenkins deployment fails with "401 Unauthorized", follow these steps:

### Option 1: Automated Script (Recommended)

1. Copy the script to your Tomcat server:
```bash
scp devops/configure-tomcat.sh user@tomcat-server:/tmp/
```

2. SSH to your Tomcat server and run:
```bash
ssh user@tomcat-server
cd /tmp
chmod +x configure-tomcat.sh
sudo ./configure-tomcat.sh
```

3. Restart Tomcat:
```bash
sudo systemctl restart tomcat
```

### Option 2: Manual Configuration

1. SSH to your Tomcat server

2. Edit tomcat-users.xml:
```bash
sudo nano /opt/tomcat/conf/tomcat-users.xml
```

3. Add these lines inside `<tomcat-users>`:
```xml
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<user username="tomcat" password="Raghu@123" roles="manager-gui,manager-script"/>
```

4. Save and restart Tomcat:
```bash
sudo systemctl restart tomcat
```

### Verify Configuration

Test manager access:
```bash
curl -u tomcat:Raghu@123 http://localhost:8080/manager/text/list
```

### Jenkins Configuration

Ensure Jenkins has these credentials configured:
- Username: `tomcat`
- Password: `Raghu@123`
- Tomcat URL: `http://your-server:8080`

## Docker Deployment

If deploying via Docker, the Dockerfile in `devops/docker/remote/Dockerfile` already includes the correct configuration.

Build and run:
```bash
docker build -t springboot-jsp -f devops/docker/remote/Dockerfile .
docker run -p 8080:8080 springboot-jsp
```
