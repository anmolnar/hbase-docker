## HBase Docker Setup

Based on @vinayakphegde 's original Docker images for HBase and extended to run two clusters side-by-side mainly for HBase Read Replica Cluster feature testing.
There are two "conf" folders for the individual cluster with common root directories (/data-store/hbase is mounted from local filesystem), but separated WAL 
directories and separate ZooKeeper databases. The "hbase" cluster is the Active Cluster while the "hbase2" is the Read Replica Cluster which is set up with 
global read-only mode enabled. 

### Build Docker Images

1. Ensure the HBase source code directory is located within the current directory (alongside the Dockerfile and other required files). The directory should contain the HBase source code needed to build the image. The structure should look like this:
   ```bash
   .
   ├── conf1/
   ├── conf2/
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
   ./build-images.sh
   ```

### Run the containers

Start "hbase" cluster:

```bash
docker-compose up -d hbase
```

Start "hbase2" cluster:

```bash
docker-compose up -d hbase2
```

Exec shell inside container:

```bash
docker exec -it <container_id> /bin/bash
```

Shutdown containers:

```bash
docker-compose down
```

