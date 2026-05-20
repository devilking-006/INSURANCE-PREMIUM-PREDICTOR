# Insurance Premium Predictor App

A production-ready full-stack machine learning deployment pipeline built with **FastAPI**, validated with **Pydantic**, fully containerized using **Docker**, and wrapped in an interactive web interface using **Streamlit**.

## 📁 Project Structure

```text
├── config/
│   └── city_tier.py
├── Model/
│   ├── model.pkl
│   └── predict.py
├── schema/
│   ├── prediction_response.py
│   └── user_input.py
├── .dockerignore
├── .gitignore
├── App.py          # FastAPI Backend Server
├── Dockerfile      # Docker Configuration
├── Frontend.py     # Streamlit Web User Interface
├── README.md
└── requirements.txt
```

## 🚀 Features
- **FastAPI Backend**: High-performance async endpoints processing input variables.
- **Streamlit Web UI**: User-friendly frontend forms with slider metrics and output visualizations.
- **Pydantic Validation**: Structural type-checking and automated backend generation for BMI and risk metrics.
- **Dockerized Base**: Multi-platform layer architecture targeting optimized container deployment environments.

## ⚠️ Configuration Alert: AWS Backend URL
The frontend application connects to the backend REST API via the `APP_URL` variable inside `Frontend.py`. The IP Address there in line 4 of `Frontend.py` is the AWS generated IP Address. Change the line as below before launching the frontend dashboard to run locally :

```python
APP_URL = "http://127.0.0.1:8000/predict"
```

---

## 🛠️ Local Setup Installation

### 1. Run via Local Virtual Environment
To spin up both systems on your machine locally, change the `APP_URL` in `Frontend.py` to `http://127.0.0.1:8000/predict` and run:

```bash
# Clone the repository
git clone https://github.com
cd insurance-premium-predictor

# Install dependencies
pip install -r requirements.txt

# Terminal 1: Launch the FastAPI Backend
uvicorn app:app --reload --port 8000

# Terminal 2: Launch the Streamlit Frontend Web UI
streamlit run Frontend.py
```

### 2. Docker Containerized Run (Recommended Backend Execution)
To run the server isolated inside a local container:

```bash
# Build the Docker image
docker build -t insurance-api .

# Run the container mapping port 8000
docker run -p 8000:8000 --name running-insurance-api insurance-api
```

## 📊 Testing Endpoints
With both components running, you can interact with the app via:
- **Web UI Client Dashboard**: `http://localhost:8501/`
- **Interactive Swagger Documentation**: `http://localhost:8000/docs`
