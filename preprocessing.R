library(tidyverse)

wave_1 = read.csv('directory_to_wave_1',header=T)
wave_2 = read.csv('directory_to_wave_2',header=T)
wave_3 = read.csv('directory_to_wave_4',header=T)
wave_4 = read.csv('directory_to_wave_4',header=T)
wave_5 = read.csv('directory_to_wave_5',header=T)
wave_6 = read.csv('directory_to_wave_6',header=T)
wave_7 = read.csv('directory_to_wave_7',header=T)

# selecting variables
id_var = c('name_of_id_vars')
demo_var = c('name_of_demographical_vars')
hlth_var = c('name_of_health_vars')
cog_var = c('name_of_cognitive_vars')

sel_var = c(id_var,int_var,demo_var, hlth_var,cog_var)

# selecting variables from the data
# wave_1
w_1 = select(wave_1, idauniq)
for(var in sel_var)
{
  if(var %in% names(wave_1))
  {
    w_1 = cbind(w_1, select(wave_1,var))
    names(w_1)[names(w_1)==var] = paster(var,'w1',sep='_')
  }
}

# wave_2
w_2 = select(wave_2, idauniq)
for(var in sel_var)
{
  if(var %in% names(wave_2))
  {
    w_2 = cbind(w_2, select(wave_2,var))
    names(w_2)[names(w_2)==var] = paster(var,'w2',sep='_')
  }
}

# wave_3
w_3 = select(wave_3, idauniq)
for(var in sel_var)
{
  if(var %in% names(wave_3))
  {
    w_3 = cbind(w_3, select(wave_3,var))
    names(w_3)[names(w_3)==var] = paster(var,'w3',sep='_')
  }
}

# wave_4
w_4 = select(wave_4, idauniq)
for(var in sel_var)
{
  if(var %in% names(wave_4))
  {
    w_4 = cbind(w_4, select(wave_4,var))
    names(w_4)[names(w_4)==var] = paster(var,'w4',sep='_')
  }
}

# wave_5
w_5 = select(wave_5, idauniq)
for(var in sel_var)
{
  if(var %in% names(wave_5))
  {
    w_5 = cbind(w_5, select(wave_5,var))
    names(w_5)[names(w_5)==var] = paster(var,'w5',sep='_')
  }
}

# wave_6
w_6 = select(wave_6, idauniq)
for(var in sel_var)
{
  if(var %in% names(wave_6))
  {
    w_6 = cbind(w_6, select(wave_6,var))
    names(w_6)[names(w_6)==var] = paster(var,'w6',sep='_')
  }
}

# wave_7
w_7 = select(wave_7, idauniq)
for(var in sel_var)
{
  if(var %in% names(wave_7))
  {
    w_7 = cbind(w_7, select(wave_7,var))
    names(w_7)[names(w_7)==var] = paster(var,'w7',sep='_')
  }
}


# merge
derived = merge(w_1,w_2, by='idauniq',all=T) %>%
  merge(w_3, by='idauniq',all=T) %>%
  merge(w_4, by='idauniq',all=T) %>%
  merge(w_5, by='idauniq',all=T) %>%
  merge(w_6, by='idauniq',all=T) %>%
  merge(w_7, by='idauniq',all=T) %>%
  select(sort(names(.))) %>%    # arrange columns in alphabetical order
  select(idauniq, everything())  # put idauniq in front


# recode the age variable and select those >=50
derived = derived %>%
  mutate_at(vars(starts_with('age')),
            funs(recode(.,'age in years on or before 29/02/1912'='90'))) %>%
  mutate_at(vars(starts_with('age')),
            funs(as.numeric(as.character(.)))) %>%
  filter_at(vars(starts_with('age')),
            all_vars(.>=50|is.na(.))) %>%
  select(-matches('age'))

# filter out the refreshment samples
derived_noref = derived %>%
  filter_at(vars(matches('refresh')),
            all_vars(.=='not refreshment sample')) %>%
  select(-matches('refresh'))

# convert factors
derived_noref = derived_noref %>%
  mutate_at(vars(matches('numtype')),
            funs(recode(.,'Best'='5','Worst'='1'))) %>%
  mutate_all(funs(as.numeric(as.character(.)))) %>%
  mutate_all(funs(replace(.,.<=0,NA))) %>%
  select_if(~sum(!is.na()>0))


#### visualisation ####
subtract = function(df){
  n = ncol(df)
  diff = data.frame(df[,2]-df[,1])
  names(diff)[1] = paste(names(df)[1],names(df)[2],sep='_')
  if(n>2){
    for(i in 2:(n-1)){
      diff = cbind(diff, df[,i+1]-df[,i])
      names(diff)[i] = paste(names(df)[i],names(df)[i+1],sep='_')
    }
  }
  diff
}


#### ####
# correlation tests
cognitive = derived_noref %>%
  select(matches('w1')) %>%
  select(-matches('numtype'))
correlations = cor(cognitive, use='complete.obs')

cortest.bartlett(correlations, n=nrow(derived_noref))
KMO(correlations)


