# Use official Python image as the base
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy all application files into the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application's port
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
