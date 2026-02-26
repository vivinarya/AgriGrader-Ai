# Sustain-Agent: Architecture & Data Flow

## 1. System Topology Overview
Sustain-Agent is constructed as a hyper-fast, localized pipeline consisting of an OCR inference engine, an emission calculation layer, and a compliance reporting module. The backend is orchestrated via custom toolchains designed for integration into standard MCP (Model Context Protocol) environments, allowing LLMs to seamlessly trigger deep-tech carbon extraction.

### Core Philosophy
* **Dynamic Resolution over Static Scaling**: By utilizing a NaViT (Native Resolution Vision Transformer) style approach for document parsing, we eliminate the artifacting commonly found in standard resized OCR CNN algorithms. This allows pristine capture of utility bills regardless of user camera quality or aspect ratio.
* **SEBI BRSR Alignment**: The output relies entirely on the SEBI (Securities and Exchange Board of India) Business Responsibility and Sustainability Reporting template standards, explicitly catering to ESG mandates for Indian enterprises scaling into the FY2026-27 compliance era.

## 2. Core Toolchain (The "Agent" Capabilities)

The cognitive loop of the agent rests entirely upon three isolated, highly-cohesive Python tools. These form the crux of the backend logic.

### Tool A: `extract_energy_data`
* **Trigger Event**: Image upload (utility bill) hits the server.
* **Mechanism**: Uses a `PaddleOCR-VL` architecture backed by a NaViT-style encoder. Instead of hard-cropping or downsampling wide receipts, the NaViT encoder processes the image at its native dynamic resolution.
* **Output**: Extracts the absolute raw energy values (kWh), isolating the string away from total bill costs or arbitrary invoice numbers using localized bounding box regex.

### Tool B: `calculate_footprint`
* **Trigger Event**: Validation of the raw `Units` mapped from Tool A.
* **Mechanism**: Immediately triggers the deterministic formula: $Footprint = Units \times 0.736$ (incorporating the verified 2026 baseline benchmark).
* **Constraints**: Hardcoded for hackathon stability, but architecturally designed to ingest dynamic `factor` parameters based on state-level grid variances (e.g., Delhi vs. Karnataka).

### Tool C: `generate_brsr_report`
* **Trigger Event**: Finalized footprint calculation scaling beyond threshold validation.
* **Mechanism**: Takes the calculated `Footprint` and maps it directly into standard SEBI BRSR templates (Principle 6: Environmental indicators). 
* **Output**: A formatted JSON/Markdown structural report that validates the carbon footprint ready for immediate compliance auditing by the "Eco-Manager."

## 3. Frontend / Backend Bridge (Stitch MCP Integration)
The extracted metrics from `Tool B` and the formalized structure from `Tool C` are piped synchronously back up to the Vanilla Tailwind UI dashboard (initially templated by Google Stitch). 

The compliance score gauge specifically binds its logic to the output of `Tool B`, where $Footprint / \text{Baseline Threshold} \times 100$ determines edge rendering colors (e.g., `eco-green` for compliance, `co2-alert` for breaches).
