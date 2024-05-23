FROM python:3.7-slim-buster

# Install necessary packages
RUN apt update -y && apt install awscli -y

# Set the working directory
WORKDIR /app

RUN git clone https://github.com/ultralytics/yolov5.git

# Copy all other files to the working directory except for yolov5
COPY . /app

# List the contents of the app directory to verify
RUN ls -l /app

# List the contents of the yolov5 directory to verify
RUN ls -l /app/yolov5

# Install the required Python packages
RUN pip install -r requirements.txt

# Set the default command to run the application
CMD ["python3", "app.py"]  