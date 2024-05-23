FROM python:3.7-slim-buster

# Install necessary packages
RUN apt update -y && apt install awscli -y

# Set the working directory
WORKDIR /app

# Copy the requirements.txt file first and install Python dependencies
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Explicitly copy the yolov5 directory and its contents
COPY yolov5 /app/yolov5

# Copy all other files to the working directory except for yolov5
COPY . /app

# List the contents of the app directory to verify
RUN ls -l /app

# List the contents of the yolov5 directory to verify
RUN ls -l /app/yolov5

# Set the default command to run the application
CMD ["python3", "app.py"]