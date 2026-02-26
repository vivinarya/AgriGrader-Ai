# Product Requirements Document (PRD): Sustain-Agent

## 1. Executive Summary
**Project Name**: Sustain-Agent
**Objective**: Develop a 24-hour hackathon MVP carbon tracking module that utilizes OCR to extract electricity usage from utility bills and maps it to a "Compliance Dashboard."
**User Persona**: "Eco-Manager" at a small enterprise needing quick, actionable ESG reporting.

## 2. Market & Data Research
### Emission Factors Confirmation
* **Current Baseline (User Provided)**: $0.736 \text{ kgCO}_2/\text{kWh}$
* **National Electricity Plan (NEP) Projection for 2026-27**: Projected to reduce to **0.548 kgCO2/kWh** due to aggressive renewable integration.
* **Regional Variances**:
  * **Karnataka**: Heavy reliance on renewable energy (~37% procurement mix) indicates a regional emission factor significantly lower than the national average.
  * **Delhi**: Zero power shortage with robust distributed solar integration, creating a lower emission footprint.
  * **Maharashtra**: Progressing with energy efficiency interventions but likely closer to the national average.
  
*Decision for MVP*: We will architect the core logic to accept dynamic regional parameters but default to the **0.736 kgCO2/kWh** benchmark you established as the baseline for standard scoring.

## 3. Functional Requirements
* **Input**: User uploads a standard utility bill image (JPEG/PNG).
* **Processing (Tool A & B)**: Extract raw energy usage (`raw_units_field`) via PaddleOCR-VL NaViT-style encoder. Multiply the extracted usage by the active Grid Emission Factor to yield a `final_tco2e_val`.
* **Output (Tool C)**: A "Compliance Score" reflecting the company's relative environmental standing mapped to a high-fidelity frontend Tailwind dashboard, as well as a SEBI BRSR formatted JSON payload.

## 4. Non-Functional Requirements & Success Metrics
* **Accuracy Metric**: OCR data extraction and calculation to fall within $\pm 5\%$ of manual human calculation.
* **Performance SLA**: End-to-end execution (Image Upload $\rightarrow$ OCR $\rightarrow$ UI Refresh) under 3 seconds.
* **Resilience**: The backend must account for inherently noisy OCR texts via defined fallback strategies.

## 5. Technical Requirements & Architecture Stack
### 5.1 Technology Stack
* **Frontend**: Vanilla HTML5 + Tailwind CSS (via CDN for rapid hackathon iteration). High-fidelity components generated via Google Stitch MCP.
* **Backend**: Python 3.13 (FastAPI for high-performance async endpoints).
* **OCR Engine**: `PaddleOCR-VL` (optimized for rapid CPU inference, avoiding heavy GPU reliance in production).
* **Image Processing**: `opencv-python` and `Pillow` for pre-processing blurry/noisy bill uploads.

### 5.2 MCP Orchestration & Tooling
* **Stitch MCP (`google-stitch`)**: Used exclusively to extract design DNA from the user-provided mockup (colors, spacing, component hierarchy) and generate the "Compliance Dashboard" structural HTML. We will specifically request "Sustain-tech" themed icons (leaves, plugs, CO2 clouds) and a robust "Compliance Score" gauge.
* **Backend MCP (`sustain-backend`)**: Custom MCP server handling the file inputs, initiating the `easyocr` pipeline, and managing data I/O to bridge frontend requests to backend computation.

### 5.3 Naming Conventions & Code Style (Hackathon Synthesis)
* **Variables**: Strict usage of `raw_bill_data`, `calc_footprint`, `vendor_id`, `raw_units_field`, and `final_tco2e_val`.
* **Functions**: Core logic operations must be prefixed with `ck_` (e.g., `ck_process_bill`, `check_vendor_id`).
* **Configurations**: Deliberately include a simple `config.py` for emission factors rather than hardcoding values globally.
* **Logging**: Use specific, pragmatic error logging simulating human frustration/sprint speed (e.g., `logger.error("Grid factor mismatch for FY2026")`).
* **Rhythm**: Code will be tightly grouped to simulate a fast-paced "sprint" hackathon style, deliberately bypassing perfect PEP8 spacing in favor of velocity.

## 6. Exclusions (Hackathon Constraints)
* No persistent cloud databases (local execution focus for MVP speed).
* Multi-page PDF parsing is explicitly out of scope for Phase 1.
* Technical debt is expected: We will explicitly leave manual "TODO" comments for edge cases (e.g., `# TODO: Handle handwritten meter readings if OCR misses` or `# FIXME: Noisy contrast boundaries`) to demonstrate roadmap awareness to judges.
