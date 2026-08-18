# Traffic Sign Recognition System (GTSRB)

An end-to-end Computer Vision application that classifies 43 distinct classes of traffic signs from the German Traffic Sign Recognition Benchmark (GTSRB) using a Deep Convolutional Neural Network (CNN) built with TensorFlow/Keras, deployed via an interactive Streamlit web interface, and containerized with Docker.

---

## Project Overview

* **Dataset:** German Traffic Sign Recognition Benchmark (GTSRB) with 51,800+ total images across 43 classes (39,209 training / 12,630 test images).
* **Pipeline:** OpenCV preprocessing -> CNN classification -> Streamlit web UI inference (<15ms latency).
* **Infrastructure:** Fully containerized using a multi-layer Docker image and automated with GitHub Actions CI.

---

## Tech Stack

| Domain | Technologies / Libraries |
| :--- | :--- |
| **Language** | Python 3.10 |
| **Deep Learning** | TensorFlow, Keras |
| **Computer Vision** | OpenCV (`opencv-python-headless`), PIL |
| **Data Processing** | NumPy, Pandas |
| **Web UI** | Streamlit |
| **DevOps & Packaging** | Docker, GitHub Actions |

---

## Image Preprocessing Pipeline

To eliminate variations caused by shadows, motion blur, and low-contrast conditions in natural driving footage:

1. **Grayscale Conversion:** Reduces RGB image matrix channels from 3 to 1 (32x32x1), dropping input data layer footprint by 88.8%.
2. **Histogram Equalization (`cv2.equalizeHist`):** Enhances contrast across overexposed and underexposed sign images.
3. **Normalization:** Scales pixel intensity values from [0, 255] to [0, 1] for stable gradient descent.
4. **Resizing:** Standardizes all input dimensions to a fixed 32x32 matrix.

---

## Repository Structure

```text
├── .github/workflows/
│   └── ci-cd.yml          # GitHub Actions CI workflow (linting & build test)
├── app.py                 # Streamlit web application & inference engine
├── Model.ipynb            # Model architecture, training, and evaluation notebook
├── labels.csv             # 43-class mapping table (ClassId to Sign Name)
├── requirements.txt       # Python package dependencies
├── Dockerfile             # Container configuration
└── README.md              # Project documentation