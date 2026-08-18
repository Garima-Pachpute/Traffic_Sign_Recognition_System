# Use an official lightweight Python runtime
FROM python:3.10-slim

# Install system dependencies required for OpenCV to run in a headless container
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first to leverage Docker's caching mechanism
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files (app.py, models, labels)
COPY app.py .
COPY model_trained.h5 .
COPY labels.csv .

# Expose the default port that Streamlit uses
EXPOSE 8501

# Command to run the Streamlit application when the container starts
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
