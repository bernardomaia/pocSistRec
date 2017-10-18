data{
  int T; //número de aspectos
  int N; //número de reviews 
  int<lower=1> U;// número de usuários
  int<lower=1, upper=U> indv_to_U[N];
  vector[N] S; //notas
  matrix[T,N] X;
}

parameters {
  matrix[U,T] alpha_user;
  real mu_alpha_U;
  real sigma_alpha_U;
}



model {
  real alpha_indv[N,T];
  for (n in 1:N)
     for (t in 1:T)
        alpha_indv[n,t] = alpha_user[indv_to_U[n],t];
  alpha_user ~ normal(mu_alpha_U, sigma_alpha_U);
  mu_alpha_U ~ normal(0, 10);
  sigma_alpha_U ~ normal(0,10);
  
  S ~ normal(X' * alpha_indv)
}  
   
