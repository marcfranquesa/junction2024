# Fingrid Datahub Customer Interaction Platform

This project is a prototype for a customer interaction platform designed to address the needs of Fingrid's clients. The goal is to provide a more transparent and user-friendly interface to allow clients to easily track upcoming system versions, feature requests, and updates.

## Problem Statement

Fingrid Datahub's system development is highly impactful for the energy sector, and the development work directly affects our clients. However, many clients find it difficult to follow up on their feature requests or to obtain an overview of system updates and new releases.

Currently, the information process consists of newsletters and downloadable files, but clients have no automated notifications and cannot easily find updated content unless they regularly check themselves.

We aim to create a prototype that resolves these pain points by providing a customizable frontend experience. The platform should make it easier for clients to stay informed and track updates in real-time.

## Approach

To solve the problem, we used the following approach:

1. **Feature Extraction**: We read through all relevant PDF documents using Mistral LLMs, which helped us to tag features for different versions of the system.
2. **Data Processing**: The extracted feature data is processed and structured into a more user-friendly format.
3. **Frontend Implementation**: A SvelteKit web app was created to allow users to easily navigate and explore the different features.

## Project Structure

### Backend

The backend of the project processes the feature data extracted from the PDFs and makes it available to the frontend. The backend is implemented using Python and includes the following:

-   **API**: Contains the main logic for serving data via HTTP.
-   **Database**: Stores the feature data and metadata.
-   **Processing**: Handles data extraction and transformation from raw PDF files to structured data.

#### Backend Directory

```
back
├── api
│   ├── Dockerfile
│   ├── main.py
│   ├── pyproject.toml
│   ├── requirements.txt
│   └── src
│       ├── init.py
│       ├── db.py
│       └── models.py
├── db
│   └── schema.sql
└── processing
    ├── llm_analyzer.py
    ├── mistral_analyzer.py
    ├── pdf_parser.py
    └── pdf_scrapper.py
```

### Frontend

The frontend of the project is implemented using SvelteKit and provides a user-friendly interface to explore the features and updates. It displays the data fetched from the backend and allows users to interact with the features in a meaningful way.

#### Frontend Directory

```
front
├── src
│   ├── lib
│   │   └── images
│   └── routes
│       ├── ball
│       ├── feature
│       │   └── [id]
│       └── internal
└── static
    └── pdfs
```

### Documentation

-   **PDF Processing**: The PDFs are processed and transformed into structured data. The data extraction happens in the `processing` folder, where scripts like `mistral_analyzer.py` are used to extract and organize the data.
-   **Feature Display**: The extracted features are displayed on the frontend, where users can navigate and explore the information.

## Running the Project

To run the project locally simply run `make`.
