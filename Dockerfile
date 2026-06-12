FROM ubuntu:latest
RUN echo "Hello from Docker containter!" > /tmp/app.txt
CMD ["cat", "/tmp/app.txt"]
