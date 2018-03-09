# Orchard Biome

My Collection of setting, prefs and environments for development to be shared across devices.

To start a biome, make sure you are running the nginx-proxy

    # Create the biome network
    $ docker network create biome
    
    # start the proxy
    $ docker run -d --rm -p 80:80 -p 3000:3000 -p 9000:9000 --net=biome -v /var/run/docker.sock:/tmp/docker.sock --name=nginx-proxy jwilder/nginx-proxy
    
