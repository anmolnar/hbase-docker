## HBase Docker Setup

### Build Docker Images

1. Create `.env` with the correct details.
2. Make the build script executable:
   ```bash
   chmod +x build_images.sh
   ```
3. Build the images:
   ```bash
   ./build_images.sh
   ```

### Run Containers

Start HBase and GeoServer:
```bash
docker-compose up -d
```