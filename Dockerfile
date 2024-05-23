FROM python:3.7-slim-buster

# Install necessary packages
RUN apt-get update && apt-get install -y \
    awscli \
    git \
    libpng-dev \
    libfreetype6-dev \
    libblas-dev \
    liblapack-dev \
    libatlas-base-dev \
    gfortran \
    gcc \
    musl-dev \
    libgl1-mesa-glx

# Set the working directory
WORKDIR /app

# Clone the YOLOv5 repository
RUN git clone https://github.com/ultralytics/yolov5.git /app/yolov5

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
