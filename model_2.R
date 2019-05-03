library(lavaan)

model_2 = '
# first layer cognitive latent constructs
cog_w1 =~ exe_w1 + mem_w1 + speed_w1 + orient_w1
cog_w2 =~ exe_w2 + mem_w2 + speed_w2 + orient_w2
cog_w3 =~ exe_w3 + mem_w3 + speed_w3 + orient_w3
cog_w4 =~ exe_w4 + mem_w4 + speed_w4 + orient_w4
cog_w5 =~ exe_w5 + mem_w5 + speed_w5 + orient_w5

# first layer physical latent constructs
phys_w2 =~ gsd_w2 + gsn_w2 + wlk_w2
phys_w4 =~ gsd_w4+ gsn_w4 + wlk_w4
phys_w6 =~ gsd_w6+ gsn_w6 + wlk_w6

# second layer growth over cognitive latent constructs
cog_i =~ 1*cog1 + 1*cog2 + 1*cog3 + 1*cog4 + 1*cog5
cog_s =~ 0*cog1 + 1*cog2 + 2*cog3 + 3*cog4 + 4*cog5

# second layer growth over physical latent constructs also predicting cognitive latents
phys_i =~ 1*phys2 + 1*phys4 + 1*phys6 + cog_s + cog_i
phys_s =~ 0*phys2 + 1*phys4 + 2*phys6 + cog_s + cog_i

cog_i ~~ cog_s
phys_i ~~ phys_s

# other covariates
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
