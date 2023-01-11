# nodejs-demo-app
**Reduce the size of the image in this branch:**

Remove unnecessary files and dependencies: I am doing this in my production stage by running npm install --only=production, which will only install the dependencies required to run the application in production.

Remove unnecessary layers: The multi-stage build in the provided Dockerfile is a good way to reduce the number of layers in your image. I copy the app from the builder stage to the prod stage and only the required files are in the prod image.

