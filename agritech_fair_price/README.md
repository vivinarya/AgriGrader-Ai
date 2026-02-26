# Agritech Fair Price Predictor | 2026 Engine

An AI-powered Visual Market Valuation Engine designed to predict fair, real-time wholesale pricing for agricultural commodities across India. It leverages Deep Learning for crop diagnosis and dynamically maps the visual health data to live market rates from the Indian Government.

## Core Architecture (Vertical Slice)
This application follows a Vertical Slice Architecture, ensuring strict logic locality.
- **Deep Learning Subsystem**: A MobileNetV2-based CNN (proxying MobileNetV4 specifications for edge/mobile capability) customized for 19 specific crop classes (Tomato, Potato, Bell Pepper, and Apple variables).
- **Market Orchestrator Subsystem**: Live, asynchronous network fetching mapping to Indian Government databases.
- **FastAPI Engine**: The central routing system managing the orchestration and deep learning invocations.

## Features
1. **Visual Crop Analytics**: Inspects photos of crops for diseases and assigns a algorithmic "Quality Multiplier" (e.g., 1.10x for pristine, 0.60x for severe blight).
2. **Live Agmarknet Pricing (data.gov.in)**: Directly queries the Open Government Data (OGD) Platform via `httpx` to locate the current `modal_price` for the diagnosed commodity.
3. **e-NAM Bid Trend Logic**: Pre-configured structure targeting `apisetu.gov.in` to calculate market bid volatility, identifying intra-day trends to apply market shift bonuses.
4. **CACP Floor Protection**: Automatically flags any mathematically suggested bid that violates the Minimum Support Price (MSP) or programmatic floor to protect the farmer from predatory purchasing.
5. **Fault Tolerant Failovers**: Equipped with robust 15-second timeouts. If the government network crashes (Gateway 504), the engine catches the exception and gracefully returns a programmatic baseline index price.

## Local Development Setup

### 1. Requirements
Ensure you have Python 3.9+ installed and a virtual environment active.
```bash
pip install -r requirements.txt
```

### 2. Live API Credentials
In `main.py`, you will find two key constants you need to activate for real data:
* `AGMARKNET_API_KEY`: Sourced from `data.gov.in` (A sandbox key is currently hard-injected for development).
* `APISETU_CLIENT_ID`: Sourced manually from the Ministry of Electronics via `apisetu.gov.in`.

### 3. Model Training
The dataset (`data/plantvillage dataset`) must be present before executing. The codebase dynamically builds an 80/20 train/test split.
```bash
python train.py
```
*The `train.py` hook automatically employs `ModelCheckpoint`, `EarlyStopping`, and `ReduceLROnPlateau` via Keras. The best weights will save to `models/crop_vision_model.h5`.*

### 4. Running the FastAPI Server
Deploy the main analytic engine.
```bash
uvicorn main:app --reload --port 8000
```
*The engine will now be listening asynchronously on `http://localhost:8000`.*

---

## Deployment (Kubernetes)
The repository contains both a `Dockerfile` and `k8s/deployment.yaml`.
```bash
docker build -t agritech-engine:latest .
kubectl apply -f k8s/deployment.yaml
```
