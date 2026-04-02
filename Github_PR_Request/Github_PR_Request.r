> library(readr)
> ghpr <- read_csv("~/Downloads/ghpr.csv")
Rows: 14384 Columns: 18                                                     
── Column specification ────────────────────────────────────────────────────
Delimiter: ","
chr  (3): issue_title, issue_body_md, issue_body_plain
dbl (14): repo_id, issue_number, issue_created_at, issue_author_id, issu...
num  (1): issue_label_ids

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(ghpr)
> # ==============================================================================
> # R SCRIPT: DATA CLEANING AND PREPARATION (GENERATES PR_DATA_CLEAN)
  > # ==============================================================================
> 
  > # --- 1. Load Essential Libraries ---
  > library(tidyverse)
── Attaching core tidyverse packages ──────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ purrr     1.1.0
✔ forcats   1.0.0     ✔ stringr   1.5.2
✔ ggplot2   4.0.0     ✔ tibble    3.3.0
✔ lubridate 1.9.4     ✔ tidyr     1.3.1
── Conflicts ────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package to force all conflicts to become errors
> library(lubridate)
> library(car)      
Loading required package: carData

Attaching package: ‘car’

The following object is masked from ‘package:dplyr’:
  
  recode

The following object is masked from ‘package:purrr’:
  
  some
> library(ggfortify)
Error in library(ggfortify) : there is no package called ‘ggfortify’

> # ==============================================================================
> # R SCRIPT: DATA CLEANING AND PREPARATION (GENERATES PR_DATA_CLEAN)
  > # ==============================================================================
> 
  > # --- 1. Load Essential Libraries ---
  > 
  > # Install packages if they are not already installed (crucial for portability)
  > if (!requireNamespace("tidyverse", quietly = TRUE)) install.packages("tidyverse")
> if (!requireNamespace("lubridate", quietly = TRUE)) install.packages("lubridate")
> if (!requireNamespace("car", quietly = TRUE)) install.packages("car")      
> if (!requireNamespace("ggfortify", quietly = TRUE)) install.packages("ggfortify")
trying URL 'https://cran.rstudio.com/bin/macosx/big-sur-arm64/contrib/4.5/ggfortify_0.4.19.tgz'
Content type 'application/x-gzip' length 534412 bytes (521 KB)
==================================================
  downloaded 521 KB


The downloaded binary packages are in
/var/folders/x4/tfm79yd949xgp2d2y3jc40ph0000gn/T//RtmpnWfYFG/downloaded_packages
> if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2") 
> if (!requireNamespace("agricolae", quietly = TRUE)) install.packages("agricolae")
also installing the dependency ‘AlgDesign’
trying URL 'https://cran.rstudio.com/bin/macosx/big-sur-arm64/contrib/4.5/AlgDesign_1.2.1.2.tgz'
trying URL 'https://cran.rstudio.com/bin/macosx/big-sur-arm64/contrib/4.5/agricolae_1.3-7.tgz'

The downloaded binary packages are in
/var/folders/x4/tfm79yd949xgp2d2y3jc40ph0000gn/T//RtmpnWfYFG/downloaded_packages
> 
  > library(tidyverse)
> library(lubridate)
> library(car)      
> library(ggfortify)
> library(ggplot2) 
> library(agricolae)
> 
  > # --- 2. Load the Raw Data ---
  > # Note: Ensure the file path below accurately points to your CSV file.
  > # Explicitly define column types to handle epoch time and numeric metrics correctly.
  > raw_ghpr <- read_csv("testraw.xlsx - Sheet1.csv", 
                         +                      col_types = cols(
                           +                          # Including repo_id here and in subsequent selections
                             +                          repo_id = col_double(), 
                           +                          issue_created_at = col_double(),
                           +                          pull_created_at = col_double(),
                           +                          pull_merged_at = col_double(),
                           +                          pull_comments = col_double(),
                           +                          pull_review_comments = col_double(),
                           +                          pull_additions = col_double(),
                           +                          pull_deletions = col_double(),
                           +                          pull_changed_files = col_double(),
                           +                          issue_author_association = col_double() 
                           +                      ))
Error: 'testraw.xlsx - Sheet1.csv' does not exist in current working directory ('/Users/joevitafaustina/Desktop/Github_PR_Request').

> # ==============================================================================
> # R SCRIPT: DATA CLEANING AND PREPARATION (GENERATES PR_DATA_CLEAN)
  > # ==============================================================================
> 
  > # --- 1. Load Essential Libraries ---
  > 
  > # Install packages if they are not already installed (crucial for portability)
  > if (!requireNamespace("tidyverse", quietly = TRUE)) install.packages("tidyverse")
> if (!requireNamespace("lubridate", quietly = TRUE)) install.packages("lubridate")
> if (!requireNamespace("car", quietly = TRUE)) install.packages("car")      
> if (!requireNamespace("ggfortify", quietly = TRUE)) install.packages("ggfortify")
> if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2") 
> if (!requireNamespace("agricolae", quietly = TRUE)) install.packages("agricolae")
> 
  > library(tidyverse)
> library(lubridate)
> library(car)      
> library(ggfortify)
> library(ggplot2) 
> library(agricolae)
> 
  > # --- 2. Load the Raw Data ---
  > # Loading 'ghpr.csv' from the current working directory since it is already imported/available.
  > file_path <- "ghpr.csv" 
> 
  > raw_ghpr <- read_csv(file_path, 
                         +                      col_types = cols(
                           +                          # Explicitly define column types to ensure correct loading
                             +                          repo_id = col_double(), 
                           +                          issue_created_at = col_double(),
                           +                          pull_created_at = col_double(),
                           +                          pull_merged_at = col_double(),
                           +                          pull_comments = col_double(),
                           +                          pull_review_comments = col_double(),
                           +                          pull_additions = col_double(),
                           +                          pull_deletions = col_double(),
                           +                          pull_changed_files = col_double(),
                           +                          issue_author_association = col_double() 
                           +                      ))
Error: 'ghpr.csv' does not exist in current working directory ('/Users/joevitafaustina/Desktop/Github_PR_Request').

> # ==============================================================================
> # R SCRIPT: DATA CLEANING AND PREPARATION (GENERATES PR_DATA_CLEAN)
  > # ==============================================================================
> 
  > # --- 1. Load Essential Libraries ---
  > 
  > # Install packages if they are not already installed (crucial for portability)
  > if (!requireNamespace("tidyverse", quietly = TRUE)) install.packages("tidyverse")
> if (!requireNamespace("lubridate", quietly = TRUE)) install.packages("lubridate")
> if (!requireNamespace("car", quietly = TRUE)) install.packages("car")      
> if (!requireNamespace("ggfortify", quietly = TRUE)) install.packages("ggfortify")
> if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2") 
> if (!requireNamespace("agricolae", quietly = TRUE)) install.packages("agricolae")
> 
  > library(tidyverse)
> library(lubridate)
> library(car)      
> library(ggfortify)
> library(ggplot2) 
> library(agricolae)
> 
  > # --- 2. Load the Raw Data ---
  > # Loading 'ghpr.csv' from the current working directory since it is already imported/available.
  > file_path <- "ghpr.csv" 
> 
  > raw_ghpr <- read_csv(file_path, 
                         +                      col_types = cols(
                           +                          # Explicitly define column types to ensure correct loading
                             +                          repo_id = col_double(), 
                           +                          issue_created_at = col_double(),
                           +                          pull_created_at = col_double(),
                           +                          pull_merged_at = col_double(),
                           +                          pull_comments = col_double(),
                           +                          pull_review_comments = col_double(),
                           +                          pull_additions = col_double(),
                           +                          pull_deletions = col_double(),
                           +                          pull_changed_files = col_double(),
                           +                          issue_author_association = col_double() 
                           +                      ))
Error: 'ghpr.csv' does not exist in current working directory ('/Users/joevitafaustina/Desktop/Github_PR_Request').

> pr_data <- read.csv("ghpr.csv")
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
  In file(file, "rt") :
  cannot open file 'ghpr.csv': No such file or directory

> View(ghpr)
> View(ghpr)
> # ----------------------------------------------------------
> # 1. Load Required Libraries
  > # ----------------------------------------------------------
> 
  > library(tidyverse)
> library(lubridate)
> library(car)
> library(ggfortify)
> library(ggplot2)
> library(agricolae)
> 
  > # ----------------------------------------------------------
> # 2. Use Already-Imported Data (ghpr)
  > # ----------------------------------------------------------
> # ghpr is already loaded and viewable using View(ghpr)
  > 
  > # ----------------------------------------------------------
> # 3. Clean, Transform, and Create Final Analysis Dataset
  > # ----------------------------------------------------------
> 
  > pr_cleaned_data <- ghpr %>%
  +     
  +     # Select only required columns
  +     select(
    +         repo_id,
    +         pull_created_at,
    +         pull_merged_at,
    +         pull_additions,
    +         pull_deletions,
    +         pull_changed_files,
    +         pull_comments,
    +         pull_review_comments,
    +         issue_author_association
    +     ) %>%
  +     
  +     # Convert timestamps + create derived variables
  +     mutate(
    +         pull_created_at = as_datetime(pull_created_at),
    +         pull_merged_at  = as_datetime(pull_merged_at),
    +         
      +         # Review time in days (original response)
      +         review_time_days = as.numeric(
        +             difftime(pull_merged_at, pull_created_at, units = "days")
        +         ),
    +         
      +         # Total comments (issue + review)
      +         total_comments =
      +             replace_na(pull_comments, 0) +
      +             replace_na(pull_review_comments, 0),
    +         
      +         merged = !is.na(pull_merged_at)
    +     ) %>%
  +     
  +     # Keep only valid merged PRs
  +     filter(
    +         merged == TRUE,
    +         review_time_days >= 0
    +     ) %>%
  +     
  +     # Log-transform response variable
  +     mutate(
    +         log_review_time = log(review_time_days + 1)
    +     ) %>%
  +     
  +     # Create PR size factor (Small vs Large)
  +     {
    +         data <- .
    +         median_files <- median(data$pull_changed_files, na.rm = TRUE)
    +         
      +         data %>%
      +             mutate(
        +                 pr_size = factor(
          +                     ifelse(pull_changed_files > median_files,
                                       +                            "Large PR", "Small PR")
          +                 )
        +             )
    +     } %>%
  +     
  +     # Factorize author association
  +     mutate(
    +         issue_author_association = factor(
      +             issue_author_association,
      +             levels = c(1, 6),
      +             labels = c("Contributor", "Member")
      +         )
    +     ) %>%
  +     
  +     # Final analysis-ready columns
  +     select(
    +         repo_id,
    +         log_review_time,
    +         review_time_days,
    +         pull_additions,
    +         pull_deletions,
    +         pull_changed_files,
    +         total_comments,
    +         issue_author_association,
    +         pr_size,
    +         pull_created_at,
    +         pull_merged_at
    +     ) %>%
  +     
  +     # Remove invalid factor rows
  +     filter(!is.na(issue_author_association))
> 
  > View(pr_cleaned_data)
> # Select numeric variables relevant for regression
  > reg_numeric_data <- pr_cleaned_data %>%
  +     select(
    +         log_review_time,
    +         pull_additions,
    +         pull_deletions,
    +         pull_changed_files,
    +         total_comments
    +     )
> 
  > # Scatterplots with regression line
  > ggplot(reg_numeric_data, aes(x = pull_additions, y = log_review_time)) +
  +     geom_point(alpha = 0.4) +
  +     geom_smooth(method = "lm", se = FALSE) +
  +     labs(
    +         title = "Log Review Time vs Pull Additions",
    +         x = "Pull Additions",
    +         y = "Log Review Time"
    +     )
`geom_smooth()` using formula = 'y ~ x'
> 
  > ggplot(reg_numeric_data, aes(x = pull_deletions, y = log_review_time)) +
  +     geom_point(alpha = 0.4) +
  +     geom_smooth(method = "lm", se = FALSE) +
  +     labs(
    +         title = "Log Review Time vs Pull Deletions",
    +         x = "Pull Deletions",
    +         y = "Log Review Time"
    +     )
`geom_smooth()` using formula = 'y ~ x'
> 
  > ggplot(reg_numeric_data, aes(x = pull_changed_files, y = log_review_time)) +
  +     geom_point(alpha = 0.4) +
  +     geom_smooth(method = "lm", se = FALSE) +
  +     labs(
    +         title = "Log Review Time vs Files Changed",
    +         x = "Files Changed",
    +         y = "Log Review Time"
    +     )
`geom_smooth()` using formula = 'y ~ x'
> 
  > ggplot(reg_numeric_data, aes(x = total_comments, y = log_review_time)) +
  +     geom_point(alpha = 0.4) +
  +     geom_smooth(method = "lm", se = FALSE) +
  +     labs(
    +         title = "Log Review Time vs Total Comments",
    +         x = "Total Comments",
    +         y = "Log Review Time"
    +     )
`geom_smooth()` using formula = 'y ~ x'
> 
  > # Compute correlation matrix
  > cor_matrix <- cor(reg_numeric_data, use = "complete.obs")
> 
  > # Display correlation matrix
  > round(cor_matrix, 3)
log_review_time pull_additions
log_review_time              1.000         -0.002
pull_additions              -0.002          1.000
pull_deletions               0.023          0.592
pull_changed_files           0.016          0.934
total_comments               0.526          0.005
pull_deletions pull_changed_files
log_review_time             0.023              0.016
pull_additions              0.592              0.934
pull_deletions              1.000              0.594
pull_changed_files          0.594              1.000
total_comments              0.059              0.035
total_comments
log_review_time             0.526
pull_additions              0.005
pull_deletions              0.059
pull_changed_files          0.035
total_comments              1.000
> 
  > View(cor_matrix)
> reg_model <- lm(
  +     log_review_time ~ pull_additions +
    +         pull_deletions +
    +         pull_changed_files +
    +         total_comments,
  +     data = pr_cleaned_data
  + )
> 
  > summary(reg_model)

Call:
  lm(formula = log_review_time ~ pull_additions + pull_deletions + 
       pull_changed_files + total_comments, data = pr_cleaned_data)

Residuals:
  Min      1Q  Median      3Q     Max 
-5.7435 -0.8796 -0.2650  0.6634  4.8148 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)         1.078e+00  1.583e-02  68.111   <2e-16 ***
  pull_additions     -6.989e-07  1.173e-06  -0.596    0.551    
pull_deletions     -2.604e-06  3.809e-06  -0.683    0.494    
pull_changed_files  2.153e-04  3.368e-04   0.639    0.523    
total_comments      3.393e-02  6.266e-04  54.153   <2e-16 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.112 on 7745 degrees of freedom
Multiple R-squared:  0.2769,	Adjusted R-squared:  0.2765 
F-statistic: 741.3 on 4 and 7745 DF,  p-value: < 2.2e-16

> 
  > View(reg_model)
> View(reg_model)
> summary(reg_model)

Call:
  lm(formula = log_review_time ~ pull_additions + pull_deletions + 
       pull_changed_files + total_comments, data = pr_cleaned_data)

Residuals:
  Min      1Q  Median      3Q     Max 
-5.7435 -0.8796 -0.2650  0.6634  4.8148 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)         1.078e+00  1.583e-02  68.111   <2e-16 ***
  pull_additions     -6.989e-07  1.173e-06  -0.596    0.551    
pull_deletions     -2.604e-06  3.809e-06  -0.683    0.494    
pull_changed_files  2.153e-04  3.368e-04   0.639    0.523    
total_comments      3.393e-02  6.266e-04  54.153   <2e-16 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.112 on 7745 degrees of freedom
Multiple R-squared:  0.2769,	Adjusted R-squared:  0.2765 
F-statistic: 741.3 on 4 and 7745 DF,  p-value: < 2.2e-16

> 
  > coef(reg_model)
(Intercept)     pull_additions     pull_deletions pull_changed_files     total_comments 
1.077908e+00      -6.989218e-07      -2.603581e-06       2.153162e-04       3.393159e-02 
> 
  > reg_model <- lm(
    +     log_review_time ~ pull_additions +
      +         pull_deletions +
      +         pull_changed_files +
      +         total_comments,
    +     data = pr_cleaned_data
    + )
> 
  > par(mfrow = c(1, 3))
> 
  > plot(reg_model, which = 1)  # Residuals vs Fitted
> plot(reg_model, which = 2)  # Normal Q-Q
> plot(reg_model, which = 3)  # Scale-Location
> 
  > par(mfrow = c(1, 1))
> 
  > ggplot(pr_cleaned_data,
           +        aes(x = issue_author_association, y = log_review_time)) +
  +     geom_boxplot() +
  +     labs(
    +         x = "Author Association",
    +         y = "Log Review Time",
    +         title = "Review Time by Author Association"
    +     )
> 
  > # Summary statistics by group for One-Way ANOVA
  > 
  > pr_cleaned_data %>%
  +     group_by(issue_author_association) %>%
  +     summarise(
    +         n = n(),
    +         mean_log_review_time = mean(log_review_time),
    +         sd_log_review_time = sd(log_review_time),
    +         median_log_review_time = median(log_review_time),
    +         min_log_review_time = min(log_review_time),
    +         max_log_review_time = max(log_review_time)
    +     )
# A tibble: 2 × 7
issue_author_association     n mean_log_review_time
<fct>                    <int>                <dbl>
  1 Contributor               5219                 1.58
2 Member                    2531                 1.61
# ℹ 4 more variables: sd_log_review_time <dbl>,
#   median_log_review_time <dbl>,
#   min_log_review_time <dbl>,
#   max_log_review_time <dbl>
> 
  > anova_oneway <- aov(
    +     log_review_time ~ issue_author_association,
    +     data = pr_cleaned_data
    + )
> 
  > summary(anova_oneway)
Df Sum Sq Mean Sq F value Pr(>F)
issue_author_association    1      2   2.183   1.277  0.258
Residuals                7748  13242   1.709               
> 
  > # Tukey HSD test with compact letter display
  > tukey_results <- HSD.test(
    +     anova_oneway,
    +     "issue_author_association",
    +     group = TRUE
    + )
> 
  > # View results
  > tukey_results
$statistics
MSerror   Df     Mean       CV
1.709067 7748 1.590245 82.20827

$parameters
test                   name.t ntr StudentizedRange alpha
Tukey issue_author_association   2         2.772241  0.05

$means
log_review_time      std    r         se          Min      Max       Q25
Contributor        1.578559 1.291357 5219 0.01809614 6.944203e-05 6.511022 0.5350879
Member             1.614342 1.339621 2531 0.02598564 1.041612e-04 6.334019 0.4925556
Q50      Q75
Contributor 1.310024 2.409784
Member      1.371880 2.467376

$comparison
NULL

$groups
log_review_time groups
Member             1.614342      a
Contributor        1.578559      a

attr(,"class")
[1] "group"
> 
  > leveneTest(log_review_time ~ issue_author_association,
               +            data = pr_cleaned_data)
Levene's Test for Homogeneity of Variance (center = median)
        Df F value  Pr(>F)  
group    1  4.1599 0.04143 *
      7748                  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
> leveneTest(log_review_time ~ issue_author_association,
+            data = pr_cleaned_data)
Levene's Test for Homogeneity of Variance (center = median)
Df F value  Pr(>F)  
group    1  4.1599 0.04143 *
  7748                  
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
  > # Calculate eta squared (effect size)
  > anova_table <- summary(anova_oneway)[[1]]
> 
  > eta_squared <- anova_table["issue_author_association", "Sum Sq"] /
  +     sum(anova_table[, "Sum Sq"])
> 
  > eta_squared
[1] 0.000164789
> 
  > # Interaction plot for Two-Way ANOVA
  > 
  > interaction.plot(
    +     x.factor = pr_cleaned_data$pr_size,
    +     trace.factor = pr_cleaned_data$issue_author_association,
    +     response = pr_cleaned_data$log_review_time,
    +     fun = mean,
    +     type = "b",
    +     pch = c(1, 19),
    +     col = c("blue", "red"),
    +     xlab = "PR Size",
    +     ylab = "Mean Log Review Time",
    +     legend = TRUE
    + )
> 
  > anova_twoway <- aov(
    +     log_review_time ~ issue_author_association * pr_size,
    +     data = pr_cleaned_data
    + )
> 
  > summary(anova_twoway)
Df Sum Sq Mean Sq F value
issue_author_association            1      2     2.2   1.331
pr_size                             1    519   518.5 316.158
issue_author_association:pr_size    1     19    18.9  11.507
Residuals                        7746  12704     1.6        
Pr(>F)    
issue_author_association         0.248722    
pr_size                           < 2e-16 ***
  issue_author_association:pr_size 0.000697 ***
  Residuals                                    
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
  > # Simple effects: PR size within each author group
  > 
  > t.test(
    +     log_review_time ~ pr_size,
    +     data = subset(pr_cleaned_data,
                        +                   issue_author_association == "Contributor")
    + )

Welch Two Sample t-test

data:  log_review_time by pr_size
t = 12.776, df = 4423.8, p-value < 2.2e-16
alternative hypothesis: true difference in means between group Large PR and group Small PR is not equal to 0
95 percent confidence interval:
  0.3900300 0.5314263
sample estimates:
  mean in group Large PR mean in group Small PR 
1.854342               1.393614 

> 
  > t.test(
    +     log_review_time ~ pr_size,
    +     data = subset(pr_cleaned_data,
                        +                   issue_author_association == "Member")
    + )

Welch Two Sample t-test

data:  log_review_time by pr_size
t = 12.482, df = 1876.8, p-value < 2.2e-16
alternative hypothesis: true difference in means between group Large PR and group Small PR is not equal to 0
95 percent confidence interval:
  0.5710445 0.7839489
sample estimates:
  mean in group Large PR mean in group Small PR 
2.040220               1.362724 

> 
  > str(ghpr)
spc_tbl_ [14,384 × 18] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
$ repo_id                 : num [1:14384] 46089560 46089560 46089560 46089560 46089560 ...
$ issue_number            : num [1:14384] 79 75 76 76 50 113 165 164 193 193 ...
$ issue_title             : chr [1:14384] "make chanotify to work with interface{} keys" "Expand relative paths given to `ctr containers start`" "Systemusage and memory.limit not in stats" "Systemusage and memory.limit not in stats" ...
$ issue_body_md           : chr [1:14384] "It a lot useful to have interface{} keys rather than string keys in Add. It allows users to export a symbol and"| __truncated__ "Specifying a relative path to `ctr containers start` results in a file not found error. It would be more user-f"| __truncated__ "When comparing stats types with the ones provided in https://github.com/docker/engine-api/blob/master/types/sta"| __truncated__ "When comparing stats types with the ones provided in https://github.com/docker/engine-api/blob/master/types/sta"| __truncated__ ...
$ issue_body_plain        : chr [1:14384] "It a lot useful to have interface{} keys rather than string keys in Add. It allows users to export a symbol and"| __truncated__ "Specifying a relative path to ctr containers start results in a file not found error. It would be more user-fri"| __truncated__ "When comparing stats types with the ones provided in https://github.com/docker/engine-api/blob/master/types/sta"| __truncated__ "When comparing stats types with the ones provided in https://github.com/docker/engine-api/blob/master/types/sta"| __truncated__ ...
$ issue_created_at        : num [1:14384] 1.45e+09 1.45e+09 1.45e+09 1.45e+09 1.45e+09 ...
$ issue_author_id         : num [1:14384] 108380 10601430 585223 585223 4228796 ...
$ issue_author_association: num [1:14384] 1 1 1 1 1 1 1 1 1 1 ...
$ issue_label_ids         : num [1:14384] NA NA NA NA NA NA NA NA NA NA ...
$ pull_number             : num [1:14384] 83 91 99 100 106 132 166 178 194 195 ...
$ pull_created_at         : num [1:14384] 1.45e+09 1.45e+09 1.45e+09 1.45e+09 1.46e+09 ...
$ pull_merged_at          : num [1:14384] 1.45e+09 1.45e+09 1.46e+09 1.46e+09 1.46e+09 ...
$ pull_comments           : num [1:14384] 2 3 1 4 4 9 4 14 2 8 ...
$ pull_review_comments    : num [1:14384] 0 0 0 0 8 0 0 4 0 1 ...
$ pull_commits            : num [1:14384] 2 1 1 2 1 2 2 4 1 2 ...
$ pull_additions          : num [1:14384] 32 6 180 130 265 ...
$ pull_deletions          : num [1:14384] 32 2 98 118 359 10 1 39 0 21 ...
$ pull_changed_files      : num [1:14384] 4 1 3 3 15 807 3 41 1 2 ...
- attr(*, "spec")=
  .. cols(
    ..   repo_id = col_double(),
    ..   issue_number = col_double(),
    ..   issue_title = col_character(),
    ..   issue_body_md = col_character(),
    ..   issue_body_plain = col_character(),
    ..   issue_created_at = col_double(),
    ..   issue_author_id = col_double(),
    ..   issue_author_association = col_double(),
    ..   issue_label_ids = col_number(),
    ..   pull_number = col_double(),
    ..   pull_created_at = col_double(),
    ..   pull_merged_at = col_double(),
    ..   pull_comments = col_double(),
    ..   pull_review_comments = col_double(),
    ..   pull_commits = col_double(),
    ..   pull_additions = col_double(),
    ..   pull_deletions = col_double(),
    ..   pull_changed_files = col_double()
    .. )
- attr(*, "problems")=<externalptr> 
  > table(is.na(ghpr$pull_merged_at))

FALSE 
14384 
> 
  > table(pr_cleaned_data$merged)
< table of extent 0 >
  Warning message:
  Unknown or uninitialised column: `merged`. 
> 
  > table(pr_cleaned_data$merged)
< table of extent 0 >
  Warning message:
  Unknown or uninitialised column: `merged`. 
> 
  > ghpr %>%
  +     mutate(merged = !is.na(pull_merged_at)) %>%
  +     ggplot(aes(merged)) +
  +     geom_bar() +
  +     labs(title = "Merged vs Unmerged Pull Requests")
> 
  > 