#!/bin/bash
work_dir=~/docker

#-----------------------------------
# Create the compose.yaml file
#-----------------------------------
cat << EOF > $work_dir/compose.yaml
name: tsteurer-com
services:
  front-end:
    image: ghcr.io/asteurer/tsteurer.com-front-end
    ports:
      - 8080:8080
EOF

# -----------------------------------
# Start the app stack
# -----------------------------------
sudo docker compose -f $work_dir/compose.yaml up -d