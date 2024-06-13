# Use a base image, for example, a lightweight web server like Nginx
FROM nginx:alpine

# Copy the contents of the src folder into the Nginx default public directory
COPY ./src /usr/share/nginx/html

# Expose port 80 (default HTTP port)
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]

#docker build -t myfrontend:v1 -t myfrontend:latest .
#docker run --name front -p 80:80 myfrontend
#Despues de esto, abrir http://<Ip de instancia Cloud9>:80

#docker rm -f $(docker ps -a -q)
#docker rmi -f $(docker images -aq)
