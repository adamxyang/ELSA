# English Longitudinal Study of Ageing (ELSA)

This study aims to investigate longitudinal associations between self-report physical activity, grip strength, gait speed and cognition utilising latent physical and cognitive variable constructs. More specifically, whether increased grip strength and gait speed predicts higher cognitive performance and whether there is a reverse causal effect. We designed a novel two-layer model which used structural equation model as the bottom layer to assess latent physical and cognitive constructs, and attached a latent growth model on top to depict longitudinal associations.

There are eight waves of data available in the English Longitudinal Study of Ageing (ELSA) dataset, and the first seven waves are suited for this study. We selected executive function, memory function, orientation function and processing speed as measures of the latent cognitive ability. Note that the executive function is missing at wave 6, and the processing speed is missing at waves 6 and 7. Grip strengths of dominant and non-dominant hands and gait speed variables are selected to measure the latent physical ability, which should all be available at waves 2, 4 and 6. Variables that are not found in the dataset but should be are indicated as `unknown`.

The (hypothetical) cognitive variables are:

| Vriable | Name in ELSA | Waves | Description |
| :---: | :---: | :---: | :---: |
| executive function | `exe` | 1 2 3 4 5 7 | index of executive function (verbal fluency) |
| memory | `mem` | 1 2 3 4 5 6 7 | index of memory function |
| orientation | `unknown` | 1 2 3 4 5 6 7 | index of orientation function |
| processing speed | `unknown` | 1 2 3 4 5 | index of processing speed |

The (hypothetical) physical variables are:

| Vriable | Name in ELSA | Waves | Description |
| :---: | :---: | :---: | :---: |
| grip strength | `unknwon` | 2 4 6 | grip strength of dominant hand (averaged) |
| grip strength | `unknown` | 2 4 6 | grip strength of non-dominant hand (averaged) |
| gait speed | `unknwon` | 2 4 6 | time taken to walk through a certain distance (averaged) |


## Model 1
