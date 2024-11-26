## HBase Docker Setup

### Build Docker Images

1. Create `.env` with the correct details.
   ```bash
   HBASE_IMAGE=vhegde/hbase-docker
   ```
2. Make the build script executable:
   ```bash
   chmod +x build_images.sh
   ```
3. Build the images:
   ```bash
   ./build_images.sh
   ```

### Run Container

Start HBase:
```bash
docker-compose up -d
```