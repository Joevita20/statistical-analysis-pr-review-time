# Statistical Analysis of Pull Request Review Time Using Regression and ANOVA

**Course:** Data Science Engineering Methods and Tools  
**Author:** Joevita Faustina Doss 

---

## Overview

Pull request (PR) reviews are a critical component of collaborative software development, directly influencing project velocity and developer productivity. This project investigates the factors that drive PR review time in open-source GitHub repositories, with a focus on collaboration activity, PR size, and author association.

The study applies three statistical methods — Multiple Regression, One-Way ANOVA, and Two-Way ANOVA — to a dataset of merged GitHub pull requests, providing a comprehensive analysis of both technical and social factors affecting review duration.

---

## Research Questions

- Does review time depend on PR size and collaboration activity?
- Do Contributors and Members differ significantly in review outcomes?
- Is there an interaction between author association and PR size that influences review time?

---

## Repository Structure

```
├── Github_PR_Request/
│   └── Github_PR_Request.r                        # Full R analysis script
├── DS_project/
│   └── Rplot*.png                                 # Diagnostic and analysis plots
├── Statistical-Analysis-of-Pull-Requests-in-Open-Source-GitHub-Repositories.pptx
└── _002055395_INFO6105_F25_Final_Project_Report.pdf
```

---

## Methodology

| Method | Purpose |
|---|---|
| Multiple Regression | Identify continuous predictors of review time |
| One-Way ANOVA | Compare review time across author association groups |
| Two-Way ANOVA | Examine joint effects of PR size and author association |

---

## Key Findings

- **Collaboration activity** (total comments) is the strongest predictor of review time (p < 2e-16), with an R² of 0.2769
- **PR size** has a strong and statistically significant main effect on review duration
- **Author association alone** does not significantly affect review time (p = 0.258)
- A **significant interaction** exists between PR size and author association (p = 0.0007), indicating that the effect of PR size on review time differs between Contributors and Members

---

## Technologies

- **Language:** R
- **Packages:** `tidyverse`, `ggplot2`, `lubridate`, `car`, `ggfortify`, `agricolae`
- **Data Source:** ghpr-dataset — Public GitHub Pull Request metadata

---

## Video Presentation

[Watch the full project presentation on YouTube](https://www.youtube.com/watch?v=ZfXXqY0Sk9U)
