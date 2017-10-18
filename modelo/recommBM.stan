data{
  int T; //número de aspectos
  int N; //número de reviews 
  int<lower=1> U;// número de usuários
  int<lower=1, upper=U> indv_to_U[N];
  vector[N] S; //notas
  matrix[T,N] X;
}

parameters {
  matrix[T,U] alpha_user;
  real mu_alpha_U;
  real sigma_alpha_U;
}



model {
  real alpha_indv[N];
  for (n in 1:N)
     alpha_indv[n] = alpha_user[indv_to_U[N]];
  alpha ~ normal(mu_alpha, sigma_alpha);
  mu_alpha ~ normal(0, 10);
  sigma_alpha ~ normal(0,10);
  
  S ~ normal(X' * alpha_indv)
}  
   
