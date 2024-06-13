set -eu

CONTAINER_ID=$(docker ps -aqf "name=server")

if [[ -n $CONTAINER_ID ]]; then
    echo "---> Stopping old container $CONTAINER_ID..."
    docker stop $CONTAINER_ID
    sleep 2s # Wait for container to be removed
fi

echo "---> Starting new container..."

docker run --rm -d --name server --cap-add=NET_ADMIN -p 80:80 -p 443:443 -p 443:443/udp \
    -v $PWD/prod/Caddyfile:/etc/caddy/Caddyfile \
    -v $PWD/landmarkfx/dist:/usr/share/caddy \
    -v caddy_data:/data \
    -v caddy_config:/config \
    caddy:latest
