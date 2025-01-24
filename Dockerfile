
# Use the official Nginx image
FROM nginx:stable
 
# Set the working directory inside the container
WORKDIR /usr/share/nginx/html
 
# Remove the default Nginx static files
RUN rm -rf ./*
 
# Copy the build folder content to the Nginx HTML directory
COPY build/ .
 
# Expose port 80 for HTTP traffic
EXPOSE 80
 
# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
