# Text Summarization App

A full-stack application that performs text summarization using a Hugging Face Transformers model hosted in a FastAPI backend, with a Flutter-based frontend for user interaction.

---

## 🚀 Project Overview

- **Backend**:  
  - Built with **FastAPI** (Python)  
  - Uses a Hugging Face summarization model (e.g., `facebook/bart-large-cnn` or any preferred model)  
  - Exposes a single HTTP endpoint (`/summarize`) that accepts raw text and returns a concise summary  

- **Frontend**:  
  - Developed in **Flutter**  
  - Presents a simple UI where users can paste or type text, tap “Summarize,” and view the generated summary  

![Architecture Diagram](docs/architecture.png)  
*Figure: High-level architecture (FastAPI ↔ Flutter)*

---

## ✨ Features

- **Text Summarization**: Uses a state-of-the-art Hugging Face Transformer model to generate concise summaries.  
- **Asynchronous, FastAPI Backend**:  
  - Non-blocking model inference  
  - Automatic interactive documentation (Swagger UI)  
- **Flutter Frontend**:  
  - Simple, modern UI for inputting text and displaying results  
  - Responsive layout suitable for mobile and web  

---

## 🛠️ Tech Stack

- **Backend**  
  - Python 3.8+  
  - [FastAPI](https://fastapi.tiangolo.com/)  
  - [Uvicorn](https://www.uvicorn.org/) (ASGI server)  
  - [Transformers](https://huggingface.co/docs/transformers/index) (Hugging Face)  
  - [Pydantic](https://pydantic-docs.helpmanual.io/) (data validation)  

- **Frontend**  
  - Flutter 3.x  
  - Dart 2.18+  
  - [`http`](https://pub.dev/packages/http) package for API calls  
  - [`provider`](https://pub.dev/packages/provider) (optional, for state management)  

---

## 📌 Prerequisites

- **For Backend**  
  - Python 3.8 or higher installed  
  - `git` installed  
  - (Optional) [virtualenv](https://virtualenv.pypa.io/) or [venv] for isolated environment  
  - Internet connection to download Transformer model  

- **For Frontend**  
  - Flutter SDK installed (≥ Flutter 3.0)  
  - Compatible IDE (VS Code, Android Studio) or CLI  
  - Android SDK / iOS toolchain for device/emulator deployment  

