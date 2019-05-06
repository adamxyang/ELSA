# English Longitudinal Study of Ageing (ELSA)

This study aims to investigate longitudinal associations between self-report physical activity, grip strength, gait speed and cognition utilising latent physical and cognitive variable constructs. More specifically, we are interested in whether increase in grip strength and gait speed predict higher cognitive performance or there is a reverse causal effect. We designed three novel two-layer models which used a structural equation model as the bottom layer to assess latent physical and cognitive constructs and attached a latent growth model on top to depict longitudinal associations. Different versions of models make use of different amount of data. 

There are eight waves of data available in the English Longitudinal Study of Ageing (ELSA) dataset, and the first seven waves are suited for this study. We selected executive function, memory function, orientation function and processing speed as measures of the latent cognitive ability. Note that the executive function is missing at wave 6, and the processing speed is missing at waves 6 and 7. Grip strengths of dominant and non-dominant hands and gait speed variables are selected to measure the latent physical ability, which should be available at waves 2, 4 and 6. Variables that are not yet ready to use are indicated as `unknown`.

The (hypothetical) cognitive variables are: 

| Vriable | Label | Name in ELSA | Waves | Description |
| :---: | :---: | :---: | :---: | :---: |
| executive function | `exe` | `exe` | 1 2 3 4 5 7 | index of executive function (verbal fluency) |
| memory | `mem` | `mem` | 1 2 3 4 5 6 7 | index of memory function |
| orientation | `orient` | `unknown` | 1 2 3 4 5 6 7 | index of orientation function |
| processing speed | `speed` | `unknown` | 1 2 3 4 5 | index of processing speed |

The (hypothetical) physical variables are:

| Vriable | Label | Name in ELSA | Waves | Description |
| :---: | :---: | :---: | :---: | :---: |
| grip strength | `grip1` | `unknown` | 2 4 6 | grip strength of dominant hand (averaged) |
| grip strength | `grip2` | `unknown` | 2 4 6 | grip strength of non-dominant hand (averaged) |
| gait speed | `gait` | `unknown` | 2 4 6 | time taken to walk through a certain distance (averaged) |


## Model 1
Due to the construction of the dataset (the physical variables are only available in three waves), the most conservative way of modelling is to only use data from waves 2,4 and 6. In this case, the only cognitive variables available in all three waves are `mem` and `speed`. At each wave (2,4,6) we used a latent cognitive variable and a latent physical variable as predictors for our manifest variables. Then we stack a latent growth model on top to predict the trends of latent variables. There are also possible other domestic covariates such as age, sex and education. The core part of the model is in the middle, where we try to predict the latent growth of cognitive variables through the latent growth of the physical variables.

Figure below gives a schematic illustration of model 1. Single headed arrows or ‘paths’ are used to define causal relationships (regressions) in the model, with the variable at the tail (or residual if there is no tail variable) of the arrow causing the variable at the point. Double headed arrows represent variances and covariances. Manifest (observed) variables are shown in squares and latent variables are shown in ovals. 

![model_1](figures/model_1.jpg?raw=true "Model_1")

In this model, we have 21 manifest variables, 10 latent variables, 21 unknown paths (where we set one path equals 1 for every latent variable), 10 variances, 12 covariances and 15 residuals. Simple calculation shows that this model is identifiable: n_knwon(n_knwon+1)/2-n_unknown = 21*22/2-10-21-10-12-15 = 163 > 0.


## Model 2
One downside of model 1 is that we wasted more than half of the cognitive data to cope with the physical variables that are only available in three waves. Since we are mostly interested in the latent growth part at the centre of the model (the intercepts and slopes), we could use more cognitive data to improve the accuracy in estimating the latent growth. Therefore, we proposed a second model that make use of five waves of cognitive data (waves 1,2,3,4,5) as we do not have all cognitive variables available at wave 6. The inductive bias behind this model is that the latent growth trend of cognitive function is mainly captured by the first five waves and we assume there is no big change on the latent cognitive variable at wave 6. A schematic diagrame of model 2 is shown below.

![model_2](figures/model_2.jpg?raw=true "Model_2")

In this model, we have 35 manifest variables, 12 latent variables, 37 unknown paths, 12 variances, 12 covariances and 29 residuals. Simple calculation shows that this model is identifiable: n_known(n_known+1)/2-n_unknown = 35*36/2-12-37-12-12-29 = 528 > 0.

## Model 3
To exploit all data available in the dataset, we further add a latent cognitive construct at wave 6 that only predicts the two available cognitive variables `mem_w6` and `speed_w6`. In other words, we add constraints to the paths from `exe_w6` and `orient_w6` by setting them to 0 as the two variables are not available at wave 6. The assumption here is that these two variables can capture the correct latent cognitive growth trend to a large extent. If this assumption is true, this model can improve our estimation of the latent cognitive growth than the previous models. Moreover, by computing the relationships between the manifest cognitive variables from the first five waves, we can obtain correlations only between these variables and use this to get better estimate of the trend at wave 6 where there are only two available cognitive variables. A schematic diagrame of model 3 is shown below.

![model_3](figures/model_3.jpg?raw=true "Model_3")

In this model, we have 37 manifest variables, 13 latent variables, 40 unknown paths, 13 variances, 12 covariances and 31 residuals. Simple calculation shows that this model is identifiable: n_known(n_known+1)/2-n_unknown = 37*38/2-13-40-13-12-31 = 594 > 0.


To study if there is a reverse causal effect, we can simply flip the arrows in the middle and try to predict `phy_intercept` and `phy_slope` using `cog_intercept` and `cog_slope`.
