library(lavaan)

model_1 = '
# first layer cognitive latent constructs
cog_w2 =~ mem_w2 + speed_w2
cog_w4 =~ mem_w4 + speed_w4
cog_w6 =~ mem_w6 + speed_w6

# first layer physical latent constructs
phys_w2 =~ gsd_w2 + gsn_w2 + wlk_w2
phys_w4 =~ gsd_w4 + gsn_w4 + wlk_w4
phys_w6 =~ gsd_w6 + gsn_w6 + wlk_w6

# second layer growth over cognitive latent constructs
cog_i =~ 1*cog_w2 + 1*cog_w4 + 1*cog_w6
cog_s =~ 0*cog_w2 + 1*cog_w4 + 2*cog_w6

# second layer growth over physical latent constructs also predicting cognitive latents
phys_i =~ 1*phys_w2 + 1*phys_w4 + 1*phys_w6 + cog_s + cog_i
phys_s =~ 0*phys_w2 + 1*phys_w4 + 2*phys_w6 + cog_s + cog_i

cog_i ~~ cog_s
phys_i ~~ phys_s

# possible other covariates
age ~~ cog_i
age ~~ cog_s
age ~~ phys_i
age ~~ phys_s

sex ~~ cog_i
sex ~~ cog_s
sex ~~ phys_i
sex ~~ phys_s

edu ~~ cog_i
edu ~~ cog_s
edu ~~ phys_i
edu ~~ phys_s
'
