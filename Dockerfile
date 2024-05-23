FROM python:3.7-slim-buster

# Install necessary packages
RUN apt update -y && apt install awscli -y

# Set the working directory
WORKDIR /app

# Copy all files to the working directory
COPY . /app

# Explicitly copy the yolov5 directory and its contents
COPY yolov5 /app/yolov5

# List the contents of the app directory to verify
RUN ls -l /app

# List the contents of the yolov5 directory to verify
RUN ls -l /app/yolov5

# Install the required Python packages
RUN pip install -r requirements.txt

# Set the default command to run the application
CMD ["python3", "app.py"]