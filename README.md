# Stroke-Risk-Prediction-ML-App

This project presents an end-to-end Machine Learning pipeline for predicting stroke risk based on patient health attributes. The objective was to build, evaluate, and deploy a classification model capable of estimating the probability of stroke occurrence using structured healthcare data.

The dataset consists of 5,110 patient records containing demographic and medical attributes such as age, hypertension, heart disease, BMI, glucose level, work type, residence type, and smoking status. Since the dataset is highly imbalanced (low stroke incidence), Synthetic Minority Oversampling Technique (SMOTE) was applied to improve model learning and reduce bias toward the majority class.

A Logistic Regression model was implemented using the tidymodels framework in R. The preprocessing workflow was constructed using recipes, which included categorical encoding (dummy variables), normalization of numeric predictors, and class balancing. The workflow was integrated into a unified modeling pipeline for reproducibility and deployment readiness.

The trained model was deployed using Shiny, creating an interactive web application that allows users to input health parameters and receive a real-time stroke risk probability prediction. This demonstrates the complete machine learning lifecycle — from data preprocessing and feature engineering to model training, evaluation, debugging, and deployment.

Key Features:

End-to-end ML pipeline using tidymodels

Logistic Regression classification model

Class imbalance handling using SMOTE

Feature preprocessing with recipes

Interactive Shiny web interface

Deployment-ready workflow

Technologies Used

R | tidymodels | Logistic Regression | SMOTE | Shiny | Data Preprocessing | Model Deployment

This project strengthened practical understanding of applied machine learning, healthcare data analysis, and model deployment strategies.
