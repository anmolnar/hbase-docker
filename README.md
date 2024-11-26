## HBase Docker Setup

### Build Docker Images

1. Ensure the HBase source code directory is located within the current directory (alongside the Dockerfile and other required files). The directory should contain the HBase source code needed to build the image. The structure should look like this:
   ```bash
   .
   ├── Dockerfile
   ├── docker-compose.yml
   ├── build-images.sh
   ├── hbase/
   │   └── [HBase source files]
   └── ...
   ```
2. Create `.env` with the correct details.
   ```bash
   HBASE_IMAGE=vhegde/hbase-docker
   ```
3. Make the build script executable:
   ```bash
   chmod +x build-images.sh
   ```
4. Build the images:
   ```bash
   ./build_images.sh
   ```

### Run Container

Start HBase:
```bash
docker-compose up -d
```
