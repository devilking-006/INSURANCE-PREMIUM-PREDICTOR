# Step 1: Use a lightweight, official Python runtime built for Linux
FROM python:3.11-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy only the requirements file first to take advantage of Docker caching
COPY requirements.txt .

# Step 4: Install your dependencies
# --no-cache-dir keeps the final image size smaller by deleting setup temporary files
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the rest of your application code into the container
# This includes App.py, the Model folder, the schema folder, and the config folder
COPY . .

# Step 6: Document that the container will listen on port 8000
EXPOSE 8000

# Step 7: Run the FastAPI application using Uvicorn
# --host 0.0.0.0 is mandatory to allow traffic outside the container to reach FastAPI
CMD ["uvicorn", "App:app", "--host", "0.0.0.0", "--port", "8000"]
