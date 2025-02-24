# IO-cTBS

## Supplement to Paper: Predicting Neuroplasticity Effects of Continuous Theta Burst Stimulation with Biomarkers from the Motor Evoked Potential TMS Input-Output Curve
It is known that individual responses to repetitive transcranial magnetic stimulation (rTMS) protocols, such as continuous theta burst stimulation (cTBS), vary considerably. The field of neuromodulation has long grappled with the challenge of predicting individual responses to brain stimulation techniques, which is necessary for consistent application with high response rates. Our study addresses this gap by investigating motor evoked potential (MEP) input-output (IO) parameters as predictors for cTBS response. We compute specific parameters of the IO curve and show they can reliably predict motor cortex responses to cTBS. This research holds significant potential for optimizing diagnostic and therapeutic uses of rTMS, and extending such methods to enhance the overall efficacy and precision of brain stimulation techniques more broadly.

This repository contains code and data files associated with the research using TMS-MEP IO curves to predict cTBS responses. Paper Reference: Parchure et al, 2025 [Preprint](https://doi.org/10.1101/2025.02.20.638871)

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
`IO subjects for LME.xlsx` and `Subject_RMT_MEP final.xlsx` contain summarized data for each subject with column key as follows: 
-Subj_ID
-Sex
-Race
-RMT: resting motor threshold
-AMT: active motor threshold
-BDNF_Genotype: single nucleotide polymorphism in the BDNF gene - CC (Val/Val), CT (Val/Met), and TT (Met/Met)
-Val_Met: BDNF genotype expressed as presence of a polymorphism (any Met allele) or not
-R^2: goodness of IO sigmoidal fit
-MEPmax: maximum MEP amplitude obtained at upper plateau of IO curve
-S50: Midpoint stimulation intensity where MEP amplitude is 50% of MEPmax
-slope: of IO curve
-MEPmin: minimum MEP amplitude obtained at lower plateau of IO curve
-RMSE: of IO sigmoidal fit
-MEP130RMT: median of 10 MEP amplitudes at 130% RMT
-SE_: standard error of variable
-_bin: binarized version of a variable by median split

---

## Coding Notebooks
### 1. Creating IO Sigmoidal Fits for Each Subject using Boltzman equation
- **File:** `create_io_sigmoidal_fits.ipynb` (To be uploaded)

### 2. Linear Mixed Effects Models
- **Description:** Used to assess the significance of predictors of MEPs across time
- **File:** `IO_LMEs.R`

### 3. Making Figures for the Paper and Linear Regressions
- **Description:** Testing for changes at the group level and within each subject. ALso, steps taken to create figures for the research paper.
- **File:** `make_figures_regressions.ipynb` (To be uploaded)

---

## Additional Information
- **Dependencies:** R and Python.
- **Usage:** Data are de-identified and publicly available for research use. The coding notebooks for reference only.

