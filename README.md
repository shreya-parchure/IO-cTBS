# IO-cTBS

## Supplement to Paper: Predicting Neuroplasticity Effects of Continuous Theta Burst Stimulation with Biomarkers from the Motor Evoked Potential TMS Input-Output Curve
It is known that individual responses to repetitive transcranial magnetic stimulation (rTMS) protocols, such as continuous theta burst stimulation (cTBS), vary considerably. The field of neuromodulation has long grappled with the challenge of predicting individual responses to brain stimulation techniques, which is necessary for consistent application with high response rates. Our study addresses this gap by investigating motor evoked potential (MEP) input-output (IO) parameters as predictors for cTBS response. We compute specific parameters of the IO curve and show they can reliably predict motor cortex responses to cTBS. This research holds significant potential for optimizing diagnostic and therapeutic uses of rTMS, and extending such methods to enhance the overall efficacy and precision of brain stimulation techniques more broadly.

This repository contains code and data files associated with the research using TMS-MEP IO curves to predict cTBS responses.
---

## Data Files
### 1. TMS-MEP Input-Output Data
`IO MEPs DataLong raw.xlsx` contains pre-processed data with columns: 
-Subj_ID 
-Frame: the trial number for MEPs
-raw_MEP: the peak to peak amplitude from electromyography in mV
-raw_Intensity: the TMS stimulator intensity setting
-%RMT: the TMS stimulator normalized to individual RMT, expressed as a percentage

### 2. Pre and Post cTBS MEPs
`MEP DataLong for LMEs.xlsx` contains pre-processed data with columns: 
-Subj_ID 
-Time: Baseline, or Post-cTBS in minutes (0, 10, 20, or 30)
-Trail: the trial number for MEPs
-%RMT: the TMS stimulator normalized to individual RMT, expressed as a percentage
-MSO: the TMS stimulator intensity setting
-MEP: the peak to peak amplitude from electromyography in mV
-lnMEP: natural log-transformed MEP value

### 3. Processed Summary Data
- **Description:** Explain how the raw data was processed and the resulting data file, which includes each subject's IO parameters and median MEP values pre and post cTBS.
- **File Format:** Specify the file format and the structure of the data.

### 4. Processed Summary Data
- **Description:** Explain how the raw data was processed and the resulting data file, which includes each subject's IO parameters and median MEP values pre and post cTBS.
- **File Format:** Specify the file format and the structure of the data.

---

## Coding Notebooks
### 1. Creating IO Sigmoidal Fits for Each Subject
- **Description:** Describe the purpose of this notebook, the methods used to create IO sigmoidal fits, and any relevant parameters or conditions.
- **File:** `create_io_sigmoidal_fits.ipynb`

### 2. Pre-processing and Normalizing MEPs Pre-Post cTBS
- **Description:** Explain the preprocessing and normalization steps performed on the MEP data, including any techniques or algorithms used.
- **File:** `preprocess_normalize_meps.ipynb`

### 3. Testing for Significance of MEP Changes in Response to cTBS
- **Description:** Describe the statistical tests or analyses used to assess the significance of MEP changes at the group level and within each subject.
- **File:** `test_significance_meps.ipynb`

### 4. Making Figures for the Paper and Linear Regressions
- **Description:** Outline the steps taken to create figures for your research paper and the methods used for linear regressions to determine how IO parameters predict cTBS MEP responses.
- **File:** `make_figures_regressions.ipynb`

---

## Additional Information
- **Dependencies:** List any software, libraries, or tools required to run the notebooks and analyze the data.
- **Installation:** Provide instructions for installing the necessary dependencies.
- **Usage:** Include usage instructions for running the notebooks and processing the data.
- **Contributing:** Outline guidelines for contributing to the project, if applicable.
- **License:** Specify the license under which the project is distributed.

---

## Contact Information
- **Author:** Provide your name and contact information for any inquiries related to the project.
- **Acknowledgments:** Mention any collaborators, funding sources, or institutions that supported the research.

