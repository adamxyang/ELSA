# English Longitudinal Study of Ageing (ELSA)

This study aims to investigate longitudinal associations between self-report physical activity, grip strength, gait speed and cognition utilising latent physical and cognitive variable constructs. More specifically, we are interested in whether increase in grip strength and gait speed predict higher cognitive performance or there is a reverse causal effect. We designed three novel two-layer models which used a structural equation model as the bottom layer to assess latent physical and cognitive constructs and attached a latent growth model on top to depict longitudinal associations.  

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
Due to the construction of the dataset (the physical variables are only available in three waves), the most conservative way of modelling is to only use data from waves 2,4 and 6. In this case, the only cognitive variables available are `mem` and `speed`. At each wave (2,4,6) we used a latent cognitive variable and a latent physical variable as predictors for our manifest variables. Then we stack a latent growth model on top to predict the trends of latent variables. There are also possible other domestic covariates such as age, sex and education. The core part of the model is in the middle, where we try to predict latent growth model of cognitive variables through latent growth model on the physical variables.

Figure below gives a schematic illustration of model 1. Single headed arrows or ‘paths’ are used to define causal relationships (regressions) in the model, with the variable at the tail (or residual if there is no tail variable) of the arrow causing the variable at the point. Double headed arrows represent covariances or correlations.
![model_1](figures/model_1.jpg?raw=true "Model_1")
To study if there is a reverse causal effect, we can simply flip the arrows in the middle and try to predict `cog_intercept` and `cog_slope` with `phy_intercept` and `phy_slope`.


## Model 2

